```markdown
# FancyContainers

A Flutter package that provides customizable gradient containers with title and subtitle.

## Features

- Create gradient containers with custom colors.
- Customize container dimensions and text styling.
- Ideal for creating stylish UI components.

## Getting started

To use this package, add `fancy_containers` as a dependency in your `pubspec.yaml` file.


```yaml
dependencies:
  fancy_containers: ^1.0.0
```

For help getting started with Flutter, view the online
[documentation](https://flutter.dev).

## Usage

You can use the `FancyContainers` widget to create gradient containers with title and subtitle.

```dart
import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';

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

For more examples, check the repository.

## Additional information

Visit the [GitHub repository](https://github.com/softengaliijaz/fancy_containers) for more information.
Feel free to [file issues](https://github.com/softengaliijaz/fancy_containers/issues) or contribute to the package.