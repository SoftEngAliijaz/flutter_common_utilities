```markdown
# Flutter Common Utilities

A Flutter utility package for creating customizable gradient containers with titles and subtitles.

## Features

- Create gradient containers with custom colors.
- Customize container dimensions and text styling.
- Responsive utility for different screen sizes.
- Ideal for creating stylish UI components.

## Getting started

To use this package, add `flutter_common_utilities` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter_common_utilities: ^0.1.5
```

For help getting started with Flutter, view the online
[documentation](https://flutter.dev).

## Usage

### FancyContainers

You can use the `FancyContainers` widget to create gradient containers with title and subtitle.

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
        body: Center(
          child: FancyContainers(
            width: 300,
            height: 200,
            color1: Colors.blue,
            color2: Colors.green,
            title: 'Hello',
            textColor: Colors.white,
            subtitle: 'Welcome to Fancy Containers',
            subtitleColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}

```

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
```