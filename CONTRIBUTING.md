# Contributing to whiteboard-clean

Thank you for your interest in contributing to whiteboard-clean! This document provides guidelines for contributing to the project.

## How to Contribute

### 1. Reporting Issues

Before creating a new issue, please:

1. **Search existing issues** to avoid duplicates
2. **Use the issue template** (if available)
3. **Include relevant information**:
   - Operating system and version
   - Python version (`python --version`)
   - ImageMagick version (`magick --version` or `convert --version`)
   - Sample image (if possible and not sensitive)
   - Complete error message
   - Steps to reproduce the issue

### 2. Suggesting Enhancements

Enhancement suggestions are welcome! Please:

1. **Check existing issues** for similar suggestions
2. **Explain the use case** and why it would be beneficial
3. **Provide examples** if possible
4. **Consider backwards compatibility**

### 3. Code Contributions

#### Getting Started

1. **Fork the repository**
2. **Clone your fork**:
   ```bash
   git clone https://github.com/yourusername/whiteboard-clean.git
   cd whiteboard-clean
   ```
3. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

#### Development Setup

1. **Install dependencies**:
   ```bash
   # ImageMagick (system dependency)
   # macOS: brew install imagemagick
   # Ubuntu: sudo apt-get install imagemagick
   # Windows: Download from imagemagick.org
   ```

2. **Test the script**:
   ```bash
   python whiteboard-clean.py --help
   ```

#### Code Style

- **Follow PEP 8** style guidelines
- **Use type hints** where appropriate
- **Write descriptive variable names**
- **Add docstrings** for functions and classes
- **Keep functions focused** and reasonably sized
- **Use meaningful commit messages**

#### Example Code Style

```python
def process_image(input_path: Path, output_path: Path, 
                 grayscale: bool = False) -> bool:
    """
    Process a single image file.
    
    Args:
        input_path: Path to input image
        output_path: Path for output image
        grayscale: Whether to convert to grayscale
        
    Returns:
        True if processing successful, False otherwise
    """
    # Implementation here
    pass
```

#### Testing

Before submitting:

1. **Test with various image formats**: JPEG, PNG, TIFF, etc.
2. **Test edge cases**: Large images, small images, corrupted files
3. **Test command-line options**: All flags and combinations
4. **Test error handling**: Invalid inputs, missing files, etc.

#### Commit Messages

Use clear, descriptive commit messages:

```
feat: add support for WebP image format
fix: resolve color cast issue in fluorescent lighting
docs: update installation instructions for Windows
refactor: simplify ImageMagick command building
test: add unit tests for file validation
```

### 4. Documentation

Documentation improvements are always welcome:

- **README updates**: Clarify instructions, add examples
- **Code comments**: Explain complex logic
- **Help text**: Improve command-line help
- **Error messages**: Make them more helpful

### 5. Pull Request Process

1. **Update documentation** if needed
2. **Test thoroughly** on different platforms if possible
3. **Update CHANGELOG.md** with your changes
4. **Create a pull request** with:
   - Clear title and description
   - Reference to related issues
   - List of changes made
   - Testing performed

#### Pull Request Template

```markdown
## Description
Brief description of changes made.

## Related Issues
Fixes #123, addresses #456

## Changes Made
- Feature 1: Description
- Fix 2: Description
- Documentation: Description

## Testing
- [ ] Tested on Linux
- [ ] Tested on macOS
- [ ] Tested on Windows
- [ ] Tested with various image formats
- [ ] Tested command-line options

## Checklist
- [ ] Code follows project style guidelines
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] No breaking changes (or documented)
```

## Areas Where Help is Needed

### High Priority
- **Performance optimization**: Faster processing algorithms
- **Memory optimization**: Handle very large images
- **Error handling**: Better error messages and recovery
- **Testing**: Automated test suite

### Medium Priority
- **Additional formats**: WebP, AVIF, HEIC support
- **GUI wrapper**: Simple graphical interface
- **Batch configuration**: Config files for consistent processing
- **Advanced features**: Perspective correction, OCR integration

### Low Priority
- **Packaging**: PyPI package, Docker image
- **Integration**: Plugins for image editors
- **Mobile support**: Android/iOS versions
- **Cloud integration**: AWS/Google Cloud processing

## Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to a positive environment:
- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

### Unacceptable Behavior

- Harassment, trolling, or insulting/derogatory comments
- Personal attacks or ad hominem arguments
- Publishing others' private information without permission
- Other conduct which could reasonably be considered inappropriate

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project maintainers. All complaints will be reviewed and investigated and will result in a response that is deemed necessary and appropriate to the circumstances.

## Development Guidelines

### ImageMagick Parameters

When adding new ImageMagick operations:

1. **Test thoroughly** with various image types
2. **Document the purpose** of each parameter
3. **Consider performance impact**
4. **Maintain backwards compatibility**
5. **Add appropriate error handling**

### Threading and Performance

- **Use ThreadPoolExecutor** for parallel processing
- **Implement proper locking** for shared resources
- **Consider memory usage** with large images
- **Add timeout protection** for long operations

### Error Handling

- **Provide helpful error messages**
- **Log errors appropriately**
- **Gracefully handle edge cases**
- **Don't crash on single file errors**

## Questions?

If you have questions about contributing:

1. **Check existing issues** and documentation
2. **Create a discussion** in the repository
3. **Contact maintainers** directly if needed

Thank you for contributing to whiteboard-clean! 🎉
