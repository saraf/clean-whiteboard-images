# Clean Whiteboard Images

![Banner](https://via.placeholder.com/800x200?text=Clean+Whiteboard+Images+%7C+Enhanced+Documentation+from+Photos)

A Bash script that automates cleaning whiteboard images using ImageMagick. Enhances photos of whiteboards by removing shadows, improving contrast, and cleaning background noise to make content more readable.

## Features

- Batch processing of multiple images
- Recursive directory searching
- Custom output directory support
- Configurable filename suffix
- Preserves original image formats
- Skip already processed files (with override option)
- Handles spaces/special characters in filenames
- Progress feedback and summary statistics

## Requirements

- [ImageMagick](https://imagemagick.org) (version 7+ recommended)
- Bash shell (Linux/macOS/WSL/Git Bash)

## Installation

```bash
# Clone repository
git clone https://github.com/yourusername/clean-whiteboard-images
cd clean-whiteboard-images

# Make script executable
chmod +x whiteboard-clean

# Install system-wide (optional)
sudo cp whiteboard-clean /usr/local/bin
```

## Usage

```bash
whiteboard-clean [OPTIONS] [FILES...]
```

### Options
| Option | Description                              | Default          |
|--------|------------------------------------------|------------------|
| `-h`   | Show help message                        |                  |
| `-r`   | Process directories recursively          | Current dir only |
| `-o`   | Overwrite existing output files          | Skip existing    |
| `-d DIR` | Output directory for processed files     | Same as input    |
| `-s SUFFIX` | Custom output suffix                   | `_cleaned`       |
| `--`   | Handle files starting with hyphen        |                  |

### Examples

1. **Basic processing** (current directory):
   ```bash
   whiteboard-clean
   ```

2. **Process specific files**:
   ```bash
   whiteboard-clean meeting1.jpg meeting2.png
   ```

3. **Recursive processing** with custom output:
   ```bash
   whiteboard-clean -r -d ./cleaned_images
   ```

4. **Overwrite existing** with custom suffix:
   ```bash
   whiteboard-clean -o -s "_enhanced" -r
   ```

## Processing Workflow

The script applies these transformations:
1. Edge enhancement (Difference of Gaussians)
2. Color inversion
3. Contrast normalization
4. Noise reduction
5. Channel-specific level adjustments

File naming example:  
`whiteboard.jpg` → `whiteboard_cleaned.jpg`

## Supported Formats

- JPEG/JPG
- PNG
- BMP
- TIFF

## Sample Results

| Input | Output |
|-------|--------|
| ![Original](https://via.placeholder.com/300x200?text=Original+Whiteboard+Photo) | ![Processed](https://via.placeholder.com/300x200?text=Enhanced+Whiteboard+Image) |

## Troubleshooting

**Command not found**  
```bash
# Verify installation
whiteboard-clean -h
```

**ImageMagick missing**  
```bash
# macOS
brew install imagemagick

# Ubuntu/Debian
sudo apt install imagemagick

# Windows: https://imagemagick.org/script/download.php
```

**Adjust processing parameters**  
Modify the `process_image()` function in the script:
```bash
convert "$infile" \
  -morphology Convolve DoG:15,100,0 \  # Edge detection
  -negate \                            # Color inversion
  -normalize \                         # Contrast adjustment
  -blur 0x1 \                          # Noise reduction
  -channel RGB -level 60%,91%,0.1 \    # Color levels
  "$outfile"
```

## License

MIT License. See [LICENSE](LICENSE) for details.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b enhance/feature`)
3. Commit changes (`git commit -am 'Add new feature'`)
4. Push to branch (`git push origin enhance/feature`)
5. Open a pull request