# 🚀 CRM App Template - The Ultimate Flutter Development Framework

> **A production-ready, scalable Flutter CRM template with Clean Architecture, Mason Brick Code Generation, and Industry Best Practices**

[![Flutter](https://img.shields.io/badge/Flutter-3.19-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.3-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Mason](https://img.shields.io/badge/Mason-Enabled-orange.svg)](https://pub.dev/packages/mason_cli)

## 🌟 Why This Template is Powerful

This isn't just another Flutter template - it's a **complete development ecosystem** that transforms how your team builds Flutter applications. Here's what makes it extraordinary:

### ✨ **Instant Feature Generation**
Generate complete features with a single command - no more copy-pasting or manual setup.

```bash
mason make feature --feature_name user_management --has_models true --has_cubit true
```

### 🏗️ **Rock-Solid Architecture**
Built on **Clean Architecture** principles with clear separation of concerns:
- **Domain Layer**: Business logic and entities
- **Data Layer**: API calls, models, and repositories
- **Presentation Layer**: UI, state management, and user interactions

### ⚡ **Lightning-Fast Development**
- **7 Custom Mason Bricks** for instant code generation
- **Pre-built widgets** for common UI patterns
- **Consistent code patterns** across your entire team
- **Zero boilerplate** - focus on business logic, not setup

### 🎯 **Enterprise-Ready**
- **Type-safe API client** with Dio
- **Robust error handling** with Either pattern
- **Internationalization** ready with Easy Localization
- **State management** with BLoC/Cubit pattern
- **Dependency injection** with GetIt
- **Navigation** with GoRouter

---

## 🚀 Quick Start

### Prerequisites
```bash
# Install Flutter (3.19+)
flutter --version

# Install Mason CLI
dart pub global activate mason_cli
```

### Setup
```bash
# Clone the template
git clone <your-repo-url>
cd crm_app

# Install dependencies
flutter pub get

# Initialize Mason
mason get

# Run the app
flutter run
```

---

## 🧱 Mason Brick System

Our Mason brick system is the **secret sauce** that makes this template incredibly powerful. Each brick generates production-ready code following your established patterns.

### Available Bricks

| Brick | Purpose | Command |
|-------|---------|---------|
| `feature` | Complete feature with Clean Architecture | `mason make feature` |
| `page` | New screen with Cubit | `mason make page` |
| `widget` | Reusable custom widget | `mason make widget` |
| `model` | Data model with JSON serialization | `mason make model` |
| `cubit` | State management cubit | `mason make cubit` |
| `repository` | Data repository | `mason make repository` |
| `api_service` | API service class | `mason make api_service` |

### 🎯 **Feature Brick - The Powerhouse**

The feature brick is your **ultimate productivity booster**. It generates:

```
features/user_management/
├── data/
│   ├── datasources/
│   │   └── user_management_remote_datasource.dart
│   ├── models/
│   │   ├── user_management_model.dart
│   │   └── params/user_management_params.dart
│   └── repositories/
│       └── user_management_repo.dart
├── domain/
│   ├── entities/
│   │   └── user_management_entity.dart
│   └── repositories/
│       └── user_management_repository.dart
└── presentation/
    ├── cubit/
    │   ├── user_management_cubit.dart
    │   └── user_management_state.dart
    ├── pages/
    │   └── user_management_page.dart
    └── widgets/
        └── user_management_widget.dart
```

**Usage Example:**
```bash
mason make feature \
  --feature_name product_catalog \
  --project_name crm_app \
  --has_models true \
  --has_params true \
  --has_cubit true \
  --has_widgets true
```

### 📱 **Page Brick - Screen Generation**

Generate new screens instantly:

```bash
mason make page \
  --page_name customer_details \
  --has_cubit true \
  --has_app_bar true
```

### 🎨 **Widget Brick - UI Components**

Create reusable widgets:

```bash
mason make widget \
  --widget_name customer_card \
  --is_stateful false \
  --has_animation true
```

---

## 🏛️ Project Architecture

### Directory Structure
```
lib/
├── app.dart                          # App entry point
├── main.dart                         # Main function
├── config/                           # App configuration
│   └── routes/                       # Navigation setup
├── core/                             # Shared utilities
│   ├── api/                          # API client & endpoints
│   ├── errors/                       # Error handling
│   ├── extensions/                   # Dart extensions
│   ├── theme/                        # App theming
│   ├── utils/                        # Utilities & widgets
│   └── services/                     # Services & DI
└── features/                         # Feature modules
    └── feature_name/
        ├── data/                     # Data layer
        ├── domain/                   # Domain layer
        └── presentation/             # UI layer
```

### Key Architectural Principles

#### 🔄 **Clean Architecture Flow**
```
UI → Cubit → Repository → DataSource → API
```

#### 🎯 **Dependency Injection**
All dependencies are managed through GetIt:

```dart
// Register your services
sl.registerLazySingleton<UserRepository>(() => UserRepoImpl(sl(), sl()));

// Use anywhere
final userRepo = sl<UserRepository>();
```

#### ⚡ **State Management**
Using BLoC pattern for predictable state management:

```dart
class UserCubit extends Cubit<UserState> {
  final UserRepository _repository;

  UserCubit(this._repository) : super(UserState.initial());

  Future<void> loadUsers() async {
    emit(state.copyWith(status: UserStatus.loading));

    final result = await _repository.getUsers();
    result.fold(
      (users) => emit(state.copyWith(
        status: UserStatus.success,
        users: users,
      )),
      (error) => emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: error.message,
      )),
    );
  }
}
```

---

## 🎨 Enhanced Design System

### Improved Color Palette

Replace your current color system with this enhanced one:

```dart
class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF6366F1);           // Modern indigo
  static const Color primaryDark = Color(0xFF4F46E5);       // Darker indigo
  static const Color secondary = Color(0xFF06B6D4);         // Cyan
  static const Color accent = Color(0xFF8B5CF6);            // Purple

  // Semantic Colors
  static const Color success = Color(0xFF10B981);           // Green
  static const Color warning = Color(0xFFF59E0B);           // Amber
  static const Color error = Color(0xFFEF4444);             // Red
  static const Color info = Color(0xFF3B82F6);              // Blue

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocus = Color(0xFF6366F1);

  // Status Colors
  static const Color online = Color(0xFF10B981);
  static const Color offline = Color(0xFF6B7280);
  static const Color pending = Color(0xFFF59E0B);
}
```

### Typography System

```dart
class AppTextStyles {
  // Headlines
  static TextStyle h1 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.25,
  );

  static TextStyle h2 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.33,
  );

  static TextStyle h3 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // Body text
  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.43,
  );

  static TextStyle bodySmall = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.33,
  );

  // Labels
  static TextStyle labelLarge = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
  );

  static TextStyle labelMedium = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );
}
```

---

## 🛠️ Development Workflow

### Adding a New Feature

1. **Generate the feature structure:**
   ```bash
   mason make feature --feature_name invoice_management
   ```

2. **Update dependency injection:**
   ```dart
   // In core/services/di.dart
   sl.registerLazySingleton<InvoiceRepository>(() => InvoiceRepoImpl(sl(), sl()));
   sl.registerLazySingleton<InvoiceRemoteDataSource>(() => InvoiceRemoteDataSourceImpl(sl()));
   ```

3. **Add API endpoints:**
   ```dart
   // In core/api/end_points.dart
   static const String invoices = '/api/invoices';
   ```

4. **Add route:**
   ```dart
   // In config/routes/app_router.dart
   GoRoute(
     path: '/invoices',
     builder: (context, state) => const InvoiceManagementPage(),
   ),
   ```

### Creating Custom Widgets

1. **Generate widget:**
   ```bash
   mason make widget --widget_name invoice_card --has_animation true
   ```

2. **Customize and integrate:**
   ```dart
   InvoiceCard(
     invoice: invoice,
     onTap: () => context.push('/invoice/${invoice.id}'),
   )
   ```

---

## 📱 Recommended VS Code Extensions

### Essential Extensions

```json
{
  "recommendations": [
    "dart-code.flutter",
    "dart-code.dart-code",
    "felixangelov.bloc",
    "alexisvt.flutter-snippets",
    "nash.awesome-flutter-snippets",
    "jeroen-meijer.pubspec-assist",
    "coenraads.bracket-pair-colorizer-2",
    "ms-vscode.vscode-json",
    "formulahendry.auto-rename-tag",
    "bradlc.vscode-tailwindcss"
  ]
}
```

### VS Code Settings

```json
{
  "dart.flutterSdkPath": "/path/to/flutter",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "files.associations": {
    "*.dart": "dart"
  }
}
```

### Code Snippets

Add these to your user snippets:

```json
{
  "BLoC Cubit": {
    "prefix": "cubit",
    "body": [
      "class ${1:Feature}Cubit extends Cubit<${1:Feature}State> {",
      "  final ${1:Feature}Repository _repository;",
      "",
      "  ${1:Feature}Cubit(this._repository) : super(const ${1:Feature}State());",
      "",
      "  $0",
      "}"
    ],
    "description": "Create a new Cubit"
  }
}
```

---

## 🚀 Performance Optimization

### Key Performance Features

- **Lazy loading** with pagination
- **Efficient state management** with BLoC
- **Optimized rebuilds** with proper widget separation
- **Image caching** with cached_network_image
- **Memory management** with proper disposal

### Performance Tips

```dart
// Use const constructors
const MyWidget({super.key});

// Implement proper disposal
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

// Use RepaintBoundary for complex widgets
RepaintBoundary(
  child: ComplexWidget(),
)
```

---

## 🧪 Testing Strategy

### Test Structure
```
test/
├── unit/
│   ├── cubits/
│   ├── repositories/
│   └── models/
├── widget/
│   └── widgets/
└── integration/
    └── app_test.dart
```

### Example Unit Test

```dart
void main() {
  group('UserCubit', () {
    late UserCubit cubit;
    late MockUserRepository repository;

    setUp(() {
      repository = MockUserRepository();
      cubit = UserCubit(repository);
    });

    blocTest<UserCubit, UserState>(
      'emits success state when getUsers succeeds',
      build: () {
        when(() => repository.getUsers())
            .thenAnswer((_) async => const Right([]));
        return cubit;
      },
      act: (cubit) => cubit.getUsers(),
      expect: () => [
        const UserState(status: UserStatus.loading),
        const UserState(status: UserStatus.success, users: []),
      ],
    );
  });
}
```

---

## 🔧 Build Configuration

### Android Configuration
```kotlin
// android/app/build.gradle
android {
    compileSdk 34

    defaultConfig {
        minSdk 21
        targetSdk 34
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
}
```

### iOS Configuration
```xml
<!-- ios/Runner/Info.plist -->
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to scan documents</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs photo library access to upload images</string>
```

---

## 📈 Scaling Your Application

### Adding New Features
1. Use feature bricks for consistency
2. Follow established patterns
3. Update dependency injection
4. Add comprehensive tests

### Team Collaboration
1. **Code Reviews**: Ensure brick-generated code is reviewed
2. **Documentation**: Update README for new features
3. **Conventions**: Maintain naming conventions
4. **Testing**: Ensure all new features are tested

### Deployment
```yaml
# GitHub Actions workflow
name: CI/CD
on:
  push:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
      - run: flutter build apk
```

---

## 🤝 Contributing

### Development Guidelines

1. **Use Mason bricks** for all new code generation
2. **Follow the established architecture**
3. **Write tests** for new features
4. **Update documentation**
5. **Use conventional commits**

### Commit Convention
```
feat: add user management feature using Mason brick
fix: resolve API client timeout issue
docs: update README with new brick instructions
style: improve button component styling
refactor: optimize state management in user cubit
test: add unit tests for user repository
```

---

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Library](https://bloclibrary.dev/)
- [Mason Documentation](https://github.com/felangel/mason)
- [Clean Architecture Guide](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

## 🎯 What's Next?

This template gives you superpowers, but the journey doesn't end here:

1. **Customize the bricks** to match your specific needs
2. **Add more widgets** to your component library
3. **Integrate analytics** and crash reporting
4. **Add CI/CD pipelines** for automated testing and deployment
5. **Create custom themes** for different clients

---

## 💬 Need Help?

- 📧 **Email**: support@yourcompany.com
- 💬 **Slack**: #flutter-development
- 📖 **Wiki**: Internal documentation
- 🐛 **Issues**: Create GitHub issues for bugs

---

**Happy Coding! 🚀**

*This template is designed to make your team 10x more productive. Use it, customize it, and build amazing Flutter applications faster than ever before.*
