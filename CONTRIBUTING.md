# Contributing to Mahe Delivery

Thank you for considering contributing to Mahe Delivery! This document provides guidelines for contributing to the project.

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Follow project guidelines

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/Mahe-delivery.git`
3. Create a feature branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test thoroughly
6. Commit with clear messages
7. Push to your fork
8. Create a Pull Request

## Development Guidelines

### Code Style

- Follow Dart and Flutter best practices
- Use meaningful variable and function names
- Keep files under 100 lines (as per project requirements)
- Add comments for complex logic
- Use proper formatting: `flutter format .`

### File Organization

```
lib/
├── core/           # Core functionality
├── features/       # Feature modules
└── shared/         # Shared components
```

### Naming Conventions

- **Files**: snake_case (e.g., `user_model.dart`)
- **Classes**: PascalCase (e.g., `UserModel`)
- **Variables**: camelCase (e.g., `userName`)
- **Constants**: UPPER_SNAKE_CASE or camelCase for const

### Architecture

- Follow clean architecture principles
- Separate UI, business logic, and data layers
- Use Provider for state management
- Keep widgets small and focused

## Pull Request Process

1. **Before Creating PR**:
   - Ensure all tests pass
   - Run linter: `flutter analyze`
   - Format code: `flutter format .`
   - Update documentation if needed

2. **PR Description**:
   - Clearly describe the changes
   - Reference related issues
   - Include screenshots for UI changes
   - List breaking changes if any

3. **PR Review**:
   - Address reviewer comments
   - Keep commits organized
   - Rebase if needed

## Testing

- Write unit tests for business logic
- Write widget tests for UI components
- Test on multiple devices/platforms
- Ensure no breaking changes

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/path/to/test_file.dart

# Run with coverage
flutter test --coverage
```

## Commit Messages

Follow conventional commits:

```
feat: add user authentication
fix: resolve cart calculation bug
docs: update README
style: format code
refactor: simplify order service
test: add cart provider tests
```

## Feature Requests

- Open an issue describing the feature
- Explain the use case and benefits
- Discuss implementation approach
- Wait for approval before implementing

## Bug Reports

Include:
- Clear description of the bug
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if applicable
- Device and OS information
- App version

## Security Issues

**Do not open public issues for security vulnerabilities.**

Email: security@mahedelivery.com

## Code Review Checklist

- [ ] Code follows project style guidelines
- [ ] Files are under 100 lines
- [ ] No hardcoded secrets or API keys
- [ ] Proper error handling
- [ ] Input validation where needed
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No console.log or debug statements
- [ ] Performance considered
- [ ] Accessibility considered

## Questions?

- Open a discussion on GitHub
- Email: dev@mahedelivery.com
- Join our community chat (if available)

## License

By contributing, you agree that your contributions will be licensed under the project's license.

Thank you for contributing to Mahe Delivery! 🎉
