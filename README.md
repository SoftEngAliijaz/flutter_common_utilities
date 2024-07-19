```markdown
# Flutter Common Utilities

A Flutter utility package for Common utils in Flutter App.

## Features

- Responsive utility for different screen sizes.
- Customize dimensions using Responsive Util.
- Ideal for creating stylish UI components.

## Getting started

To use this package, add `flutter_common_utilities` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter_common_utilities: ^latest
```

For help getting started with Flutter, view the online
[documentation](https://flutter.dev).

## Usage

### ResponsiveUtil

You can use the `ResponsiveUtil` widget to create different layouts for different screen sizes.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_common_utilities/flutter_common_utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ResponsiveUtil(
          mobile: MobileWidget(),
          mobileLarge: MobileLargeWidget(),
          tablet: TabletWidget(),
          desktop: DesktopWidget(),
        ),
      ),
    );
  }
}

class MobileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Mobile'));
  }
}

class MobileLargeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Mobile Large'));
  }
}

class TabletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Tablet'));
  }
}

class DesktopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Desktop'));
  }
}

```

For more examples, check the repository.

## Additional information

Visit the [GitHub repository](https://github.com/SoftEngAliijaz/flutter_common_utilities) for more information.
Feel free to [file issues](https://github.com/SoftEngAliijaz/flutter_common_utilities/issues) or contribute to the package.