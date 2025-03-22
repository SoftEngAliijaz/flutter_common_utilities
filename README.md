# Flutter Common Utilities

*A powerful Flutter utility package for building responsive and adaptive UI layouts effortlessly.*

## 🚀 Features

- **Responsive Utilities** – Easily adapt UI to various screen sizes and orientations.
- **Customizable Breakpoints** – Define screen size breakpoints for mobile, tablet, and desktop views.
- **Animated Transitions** – Smooth layout transitions with built-in animations.
- **`FlutterCommonStepper`** – A stepper widget to guide users through step-based workflows.
- **`ResponsiveGridView`** – A flexible grid layout that adjusts column count dynamically based on screen size.

## 📦 Installation

Add `flutter_common_utilities` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_common_utilities: ^latest_version
```

Then, run:

```sh
flutter pub get
```

## 🛠 Usage

### 🏗 ResponsiveUtil

`ResponsiveUtil` helps you create adaptive layouts that adjust based on the screen size.

```dart
ResponsiveUtil(
  mobile: MobileView(),
  tablet: TabletView(),
  desktop: DesktopView(),
)
```

### 🔄 FlutterCommonStepper

Use `FlutterCommonStepper` for intuitive step-by-step navigation.

```dart
FlutterCommonStepper(
  currentStep: 2,
  totalSteps: 5,
  onStepChange: (step) => print("Step: \$step"),
)
```

### 📐 ResponsiveGridView

Create a dynamic grid that adapts to different screen sizes.

```dart
ResponsiveGridView(
  itemCount: 10,
  builder: (context, index) => GridItem(index),
)
```

## 🎯 Example

Explore the example project to see these widgets in action:

```sh
cd example
flutter run
```

## 📚 Additional Resources

- [GitHub Repository](https://github.com/SoftEngAliijaz/flutter_common_utilities)
- [Report Issues](https://github.com/SoftEngAliijaz/flutter_common_utilities/issues)
- [Contribute to Development](https://github.com/SoftEngAliijaz/flutter_common_utilities)

---

📢 **Stay up to date** – Star the repo and follow updates for the latest improvements! 🚀