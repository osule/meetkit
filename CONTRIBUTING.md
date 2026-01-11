# Contributing to MeetKit

Thank you for your interest in contributing to MeetKit! This document provides guidelines for contributing to the project.

## How to Contribute

### Reporting Issues

- Use GitHub Issues to report bugs or request features
- Search existing issues before creating new ones
- Provide clear reproduction steps for bugs
- Include environment details (Kubernetes version, Helm version, etc.)

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test your changes thoroughly
5. Update documentation if needed
6. Commit with clear messages
7. Push and create a pull request

### Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/meetkit.git
cd meetkit

# Test the chart
helm lint .
helm template . --values examples/minimal.yaml
```

### Testing

- Test chart installation on a real Kubernetes cluster
- Verify all authentication methods work
- Check resource limits and scaling
- Test with different ingress controllers

### Code Style

- Follow Helm best practices
- Use meaningful variable names
- Add comments for complex logic
- Keep templates readable and maintainable

### Documentation

- Update README.md for new features
- Add examples for new configuration options
- Update CHANGELOG.md for releases

## Community

- Be respectful and inclusive
- Help others learn and contribute
- Follow the Code of Conduct

## Questions?

Open an issue for questions or join discussions in existing issues.