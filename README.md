```markdown
# Flutter Common Utilities

"A Flutter utility package providing essential tools for responsive and adaptive UI development in Flutter applications."

## Features

- Responsive utility for different screen sizes and orientations.
- Customizable breakpoints for mobile, tablet, and desktop views.
- Animated transitions between different layouts.
- FlutterCommonStepper widget for displaying step-by-step progress in a user-friendly manner.

## Getting Started

To use this package, add `flutter_common_utilities` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter_common_utilities: ^latest_version
```

For help getting started with Flutter, view the online
[documentation](https://flutter.dev).

## Usage

### ResponsiveUtil

The `ResponsiveUtil` widget helps you create different layouts for different screen sizes and orientations. It supports mobile, mobile large, tablet, and desktop views with smooth transitions.

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
      title: 'Responsive Util Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Util Example'),
      ),
      body: ResponsiveUtil(
        mobile: MobileHomeScreen(),
        mobileLarge: MobileLargeHomeScreen(),
        tablet: TabletHomeScreen(),
        desktop: DesktopHomeScreen(),
      ),
    );
  }
}

class MobileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Mobile Home Screen'));
  }
}

class MobileLargeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Mobile Large Home Screen'));
  }
}

class TabletHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Tablet Home Screen'));
  }
}

class DesktopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Desktop Home Screen'));
  }
}
```

### FlutterCommonStepper

The `FlutterCommonStepper` widget helps you display a step-by-Flutter Common Stepper. It allows customization for step colors, line width, and supports navigation between steps.

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
      title: 'Flutter Common Stepper Example',
      home: StepperHomeScreen(),
    );
  }
}

class StepperHomeScreen extends StatefulWidget {
  @override
  _StepperHomeScreenState createState() => _StepperHomeScreenState();
}

class _StepperHomeScreenState extends State<StepperHomeScreen> {
  int _currentStep = 1;
  final int _totalSteps = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Common Stepper Example'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: FlutterCommonStepper(
                width: MediaQuery.of(context).size.width,
                currentStep: _currentStep,
                totalSteps: _totalSteps,
                completedStepColor: Colors.blue,
                activeStepColor: Color(0xffdbecff),
                inactiveStepColor: Color(0xffbababa),
                lineWidth: 3.5,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentStep > 1) _currentStep--;
                  });
                },
                child: Text('Back'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentStep < _totalSteps) _currentStep++;
                  });
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## Example

An example project demonstrating how to use the `ResponsiveUtil` widget and the `FlutterCommonStepper`.

To run the example, navigate to the `example` directory and use the following command:

```sh
flutter run
```

- The example showcases how to use both the `ResponsiveUtil` widget for responsive layouts. 
- The `FlutterCommonStepper` widget helps you display a step-by-step progress indicator.

## Additional Information

Visit the [GitHub repository](https://github.com/SoftEngAliijaz/flutter_common_utilities) for more information. Feel free to [file issues](https://github.com/SoftEngAliijaz/flutter_common_utilities/issues) or contribute to the package.
