#!/bin/bash

# Default configuration
OUTPUT_DIR="cleaned"
SUFFIX="_cleaned"
RECURSIVE=false
FORCE=false
BLUR_RADIUS=15
VERBOSE=false
PROCESSED=0
SKIPPED=0
FAILED=0
declare -a FAILED_FILES

# Check for ImageMagick
if ! command -v convert &>/dev/null; then
    echo "Error: ImageMagick is required but not installed." >&2
    echo "Please install it from https://imagemagick.org" >&2
    exit 1
fi

# Show help
show_help() {
    cat << EOF
Usage: ${0##*/} [OPTIONS] [INPUT_DIR...]
Clean whiteboard images using ImageMagick.

Options:
  -d, --output-dir DIR   Output directory (default: $OUTPUT_DIR)
  -s, --suffix SUFFIX    Filename suffix (default: $SUFFIX)
  -r, --recursive        Process directories recursively
  -f, --force            Reprocess existing files
  -b, --blur RADIUS      Blur radius for background removal (default: $BLUR_RADIUS)
  -v, --verbose          Show detailed processing information
  -h, --help             Display this help and exit

If no INPUT_DIR is provided, processes current directory.
Supported formats: JPG, JPEG, PNG, WEBP, TIFF, TIF
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -d|--output-dir)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        -s|--suffix)
            SUFFIX="$2"
            shift 2
            ;;
        -b|--blur)
            BLUR_RADIUS="$2"
            shift 2
            ;;
        -r|--recursive)
            RECURSIVE=true
            shift
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            show_help
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

# Handle input directories
INPUT_DIRS=("$@")
[[ ${#INPUT_DIRS[@]} -eq 0 ]] && INPUT_DIRS=(".")

# Create output directory
mkdir -p "$OUTPUT_DIR" || exit 1

# Process files
process_file() {
    local input_file="$1"
    local filename=$(basename -- "$input_file")
    local extension="${filename##*.}"
    local basefile="${filename%.*}"
    local output_file="${OUTPUT_DIR}/${basefile}${SUFFIX}.${extension,,}"

    # Skip existing files unless force mode
    if [[ $FORCE == false && -f "$output_file" ]]; then
        ((SKIPPED++))
        [[ $VERBOSE == true ]] && echo "Skipping: $input_file (already processed)"
        return 0
    fi

    # Process the image
    [[ $VERBOSE == true ]] && echo "Processing: $input_file"
    if convert "$input_file" -flatten \
        \( +clone -grayscale Rec709Luminance -blur "0x$BLUR_RADIUS" \) \
        -compose Divide_Src -composite \
        -auto-level \
        "$output_file" 2>/dev/null; then
        ((PROCESSED++))
    else
        echo "Error: Failed to process $input_file" >&2
        ((FAILED++))
        FAILED_FILES+=("$input_file")
        return 1
    fi
}

# Find and process files
for dir in "${INPUT_DIRS[@]}"; do
    if [[ $RECURSIVE == true ]]; then
        while IFS= read -r -d $'\0' file; do
            process_file "$file"
        done < <(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o \
                  -iname "*.png" -o -iname "*.webp" -o -iname "*.tif" -o \
                  -iname "*.tiff" \) -print0)
    else
        while IFS= read -r -d $'\0' file; do
            process_file "$file"
        done < <(find "$dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o \
                  -iname "*.png" -o -iname "*.webp" -o -iname "*.tif" -o \
                  -iname "*.tiff" \) -print0)
    fi
done

# Print summary
echo ""
echo "===== Processing Summary ====="
echo "Processed: $PROCESSED"
echo "Skipped:   $SKIPPED"
echo "Failed:    $FAILED"

# Print failed files if any
if [[ $FAILED -gt 0 ]]; then
    echo -e "\nFailed files:"
    printf '  - %s\n' "${FAILED_FILES[@]}"
fi

exit 0