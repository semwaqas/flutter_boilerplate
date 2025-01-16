# 📱 Get Started Boilerplate

Welcome to the **Get Started Boilerplate**! This project provides a robust and scalable starting point for Flutter applications, incorporating **Clean Architecture**, **responsive design**, **state management**, and other modern Flutter practices.

---

## 🚀 Features

- **Clean Architecture**: A scalable structure following Domain-Driven Design principles.
- **Boilerplate Automation**: Quickly generate feature modules using **Mason**.
- **Dark Mode**: Fully supported with customizable themes.
- **Advanced Image Loading**: A custom `ImageView` widget that supports all image types, including SVG.
- **Caching**: Efficient caching for network requests to improve performance.
- **Utilities and Extensions**: Reusable utilities, extensions, and validators to simplify development.
- **Localization**: Multilingual support using **easy_localization**.
- **Dependency Injection**: Managed with **get_it** for scalable and maintainable architecture.

---

## 📖 Getting Started

### 1️⃣ Fork and Clone the Repository

- Click the **Fork** button on this repository.
- Clone the forked repository:

  ```bash
  git clone https://github.com/yourusername/get_started_boilerplate.git
  cd get_started_boilerplate
  ```

### 2️⃣ Install Dependencies

Run the following command:

```bash
flutter pub get
```

### 3️⃣ Run the App

Launch the app:

```bash
flutter run
```

---

## 🛠 Using Mason for Boilerplate Generation

### What is Mason?

Mason is a tool to create reusable code templates called "bricks." In this project, **Mason** is preconfigured to scaffold **Clean Architecture** feature modules.

### Installing Mason

1. Install Mason globally:

   ```bash
   dart pub global activate mason_cli
   ```

2. Verify installation:

   ```bash
   mason --version
   ```

### Generating a New Feature

To generate a feature using Mason, run:

```bash
mason make feature -o ./lib/features
```

Provide details like the feature name and include the required layers (Domain, Data, Presentation).

---

## 🖌 Theme Management

This project supports **light** and **dark** modes. Themes can be customized in the `core/theme` directory. The app automatically adapts to the system theme and allows manual switching.

---

## 🌐 Networking and Caching

### Networking

The project uses the **Dio** package for making efficient HTTP requests.

### Caching

To optimize performance:
- Responses from network requests are cached.
- Cached data is stored locally and invalidated based on specific conditions.

---

## 🖼 Custom Image View

The `CustomImageView` widget is a powerful utility for handling all types of images:

- **Network Images**: Load images from a URL.
- **SVG Images**: Render SVG files seamlessly.
- **Local Assets**: Display images stored in the app.

### Usage:

```dart
CustomImageView(
  imageUrl: 'https://example.com/image.svg', 
  placeholder: Icons.image, // Optional placeholder
);
```

---

## 🧩 Utilities, Extensions, and Validators

### Utilities

Reusable functions for common tasks like date formatting, color manipulation, etc., are available in the `core/utils` directory.

### Extensions

Dart extensions simplify common operations. Examples:
- String extensions for validation.
- Context extensions for easier theme or localization access.

### Validators

Predefined input validators for forms, such as:
- Email validation.
- Phone number validation.
- Password strength checking.

**Example**:

```dart
bool isValid = 'example@gmail.com'.isValidEmail();
```

---

## 📂 Project Structure

```bash
lib/
├── core/                        # Core functionality shared across the app
│   ├── common/                  # Common theme configurations
│   │   ├── constants/           # Common constant values for themes
│   │   ├── strings/             # Theme-related string resources
│   │   ├── theme/               # Main theme settings and styling
│   ├── env/                     # Environment-specific configurations
│   │   ├── types/               # Environment-specific types
│   ├── routes/                  # Route utilities and helpers
│   ├── services/                # Dart extension services
│   ├── http/                    # HTTP-related Dart extensions
│   │   ├── log/                 # HTTP request/response logging
│   │   ├── navigation/          # Navigation helpers for HTTP
│   │   ├── storage/             # Storage utilities for HTTP data
│   │   ├── utils/               # Input validation and utility functions
│   ├── widgets/                 # Common widgets for input validation
├── features/                    # Feature-specific modules, organized by domain
│   ├── feature_name/            # Example of a feature module
│       ├── data/                # Data layer (models, data sources)
│       ├── domain/              # Domain layer (entities, use cases, repositories)
│       └── presentation/        # Presentation layer (screens, widgets, bloc)
├── injection_container.dart     # Sets up the dependency injection container
└── main.dart                    # Main entry point of the app
```

---

## 🤝 Contributing

We ❤️ contributions! Here’s how to contribute:

1. **Fork the Repo**: Create your own copy.
2. **Create a Branch**: Use descriptive names:
   ```bash
   git checkout -b feature/your_feature_name
   ```
3. **Make Changes**: Implement your feature.
4. **Test Changes**: Ensure everything works as expected.
5. **Submit a Pull Request**: Share your updates with the community.

---

## 🌐 Community

- **Issues**: Found a bug? [Submit an issue](#).
- **Discussions**: Share ideas on the [Discussions Page](#).

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 💡 Tips

- **Run Linting**: Keep your code clean with:

  ```bash
  flutter analyze
  ```

- **Check for Updates**: Update dependencies regularly:

  ```bash
  flutter pub outdated
  ```

---
