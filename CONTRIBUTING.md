# Contributing to Elythra Music 🎵

Thank you for your interest in contributing to Elythra Music! This is a community-maintained fork of Harmony Music, and we welcome all kinds of contributions.

## 🤝 How to Contribute

### 🐛 Reporting Bugs
1. Check if the bug has already been reported in [Issues](https://github.com/shaolinOP/-ElythraMusic-/issues)
2. If not, create a new issue with:
   - Clear description of the bug
   - Steps to reproduce
   - Expected vs actual behavior
   - Device/platform information
   - Screenshots/logs if applicable

### ✨ Suggesting Features
1. Check [existing feature requests](https://github.com/shaolinOP/-ElythraMusic-/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)
2. Create a new issue with:
   - Clear description of the feature
   - Use case and benefits
   - Possible implementation approach

### 🔧 Code Contributions

#### Prerequisites
- Flutter SDK 3.24.5+
- Dart SDK 3.1.5+
- Git knowledge
- Android Studio (for Android development)

#### Development Setup
```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/YOUR_USERNAME/-ElythraMusic-.git
cd -ElythraMusic-

# Add upstream remote
git remote add upstream https://github.com/shaolinOP/-ElythraMusic-.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

#### Making Changes
1. **Create a branch** for your feature/fix:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Follow coding standards**:
   - Use meaningful variable and function names
   - Add comments for complex logic
   - Follow Dart/Flutter conventions
   - Run `flutter analyze` before committing

3. **Test your changes**:
   ```bash
   flutter test
   flutter analyze
   ```

4. **Commit your changes**:
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```
   
   Use conventional commit messages:
   - `feat:` for new features
   - `fix:` for bug fixes
   - `docs:` for documentation
   - `style:` for formatting
   - `refactor:` for code refactoring
   - `test:` for adding tests

5. **Push and create PR**:
   ```bash
   git push origin feature/your-feature-name
   ```
   Then create a Pull Request on GitHub.

## 🎯 Priority Areas

We especially need help with:

### 🔥 High Priority
- **Bug fixes** and stability improvements
- **Dependency updates** and security patches
- **Performance optimizations**
- **iOS support** completion
- **Web platform** support

### 📱 Platform Support
- **Android**: Primary platform (well supported)
- **Windows**: Good support, needs testing
- **Linux**: Good support, needs testing
- **iOS**: In development, needs contributors
- **macOS**: Planned, needs contributors
- **Web**: Planned, needs contributors

### 🌍 Localization
- **Translation**: Help translate the app
- **RTL support**: Right-to-left language support
- **Cultural adaptations**: Region-specific features

### 🎨 UI/UX
- **Material Design 3** implementation
- **Accessibility** improvements
- **Dark/Light theme** enhancements
- **Responsive design** for different screen sizes

## 📋 Code Guidelines

### Dart/Flutter Best Practices
```dart
// ✅ Good
class MusicPlayer {
  final AudioService _audioService;
  
  MusicPlayer(this._audioService);
  
  Future<void> playTrack(Track track) async {
    try {
      await _audioService.play(track.url);
    } catch (e) {
      logger.error('Failed to play track: $e');
      rethrow;
    }
  }
}

// ❌ Avoid
class musicplayer {
  var audioservice;
  playtrack(track) {
    audioservice.play(track.url);
  }
}
```

### File Organization
```
lib/
├── main.dart
├── app/
│   ├── routes/
│   ├── themes/
│   └── constants/
├── features/
│   ├── player/
│   ├── playlist/
│   └── search/
├── shared/
│   ├── widgets/
│   ├── services/
│   └── utils/
└── core/
    ├── error/
    ├── network/
    └── storage/
```

### State Management
- Use **GetX** for state management (existing pattern)
- Keep controllers focused and single-responsibility
- Use reactive programming patterns

### Error Handling
```dart
// Always handle errors gracefully
try {
  final result = await apiCall();
  return Right(result);
} catch (e) {
  logger.error('API call failed: $e');
  return Left(NetworkFailure(e.toString()));
}
```

## 🧪 Testing

### Running Tests
```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Code analysis
flutter analyze
```

### Writing Tests
- Write unit tests for business logic
- Add widget tests for UI components
- Include integration tests for critical flows

## 📚 Documentation

### Code Documentation
- Document public APIs
- Add inline comments for complex logic
- Update README for new features

### User Documentation
- Update user guides for new features
- Add troubleshooting sections
- Keep changelog updated

## 🔄 Pull Request Process

1. **Before submitting**:
   - Ensure all tests pass
   - Run `flutter analyze` with no issues
   - Update documentation if needed
   - Rebase on latest main branch

2. **PR Description**:
   - Clear title describing the change
   - Detailed description of what was changed
   - Link to related issues
   - Screenshots for UI changes

3. **Review Process**:
   - Maintainers will review your PR
   - Address feedback promptly
   - Keep PR focused and atomic

## 🏷️ Issue Labels

- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Improvements to docs
- `good first issue` - Good for newcomers
- `help wanted` - Extra attention needed
- `priority: high` - Critical issues
- `platform: android` - Android specific
- `platform: ios` - iOS specific
- `platform: desktop` - Desktop platforms

## 💬 Communication

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and general discussion
- **Pull Requests**: Code review and collaboration

## 🙏 Recognition

Contributors will be:
- Listed in the README credits
- Mentioned in release notes
- Given appropriate GitHub repository permissions for regular contributors

## 📄 License

By contributing, you agree that your contributions will be licensed under the GPL v3.0 License.

---

Thank you for helping keep Elythra Music alive and thriving! 🎵✨