# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Nothing yet

### Changed
- Nothing yet

### Fixed
- Nothing yet

## [1.0.0] - 2025-01-XX

### Added
- Initial release of whiteboard-clean
- Color-preserving image processing mode (default)
- Grayscale processing mode (`-g` flag)
- Batch processing with recursive directory support (`-r` flag)
- Multi-threaded processing for improved performance (`-j` flag)
- Custom output directory support (`-o` flag)
- Custom filename suffix support (`-s` flag)
- Force overwrite option (`-f` flag)
- Verbose logging (`-v` flag)
- Comprehensive error handling and logging
- Support for multiple image formats (JPEG, PNG, TIFF, BMP, GIF)
- Pure white background correction to eliminate color casts
- Advanced ImageMagick processing pipeline with:
  - Auto-level for color cast removal
  - White-point correction for pure white backgrounds
  - Sigmoidal contrast enhancement
  - Noise reduction with edge preservation
  - Text sharpening with unsharp mask
  - Color enhancement while preserving marker colors

### Technical Details
- Python 3.7+ compatibility
- ImageMagick 6.x and 7.x support
- Thread-safe processing with configurable worker count
- Memory-efficient processing (one image per thread)
- Comprehensive input validation and error handling
- Cross-platform compatibility (Windows, macOS, Linux)
- Command-line interface with helpful usage examples

### Performance
- Processing speed: ~2-3 seconds per image (single-threaded)
- Memory usage: Low (processes one image at a time per thread)
- Timeout protection: 5-minute timeout per image
- Scalable multi-threading based on CPU cores

### ImageMagick Operations
- Color mode: 12-step processing pipeline for color preservation
- Grayscale mode: 8-step processing pipeline for optimal contrast
- Both modes include noise reduction, sharpening, and white balance correction
