import 'package:flutter/material.dart';
import 'package:flutter_common_utilities/flutter_common_utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Common Utilities Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleHomeScreen(),
    );
  }
}

class ExampleHomeScreen extends StatelessWidget {
  const ExampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Common Utilities Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Responsive Util'),
              Tab(text: 'Stepper Example'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ResponsiveUtilExample(),
            StepperExample(),
          ],
        ),
      ),
    );
  }
}

class ResponsiveUtilExample extends StatelessWidget {
  const ResponsiveUtilExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Mobile Home Screen'));
  }
}

class MobileLargeHomeScreen extends StatelessWidget {
  const MobileLargeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Mobile Large Home Screen'));
  }
}

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tablet Home Screen'));
  }
}

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Desktop Home Screen'));
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 1;
  final int _totalSteps = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: FlutterCommonStepper(
              width: MediaQuery.of(context).size.width,
              currentStep: _currentStep,
              totalSteps: _totalSteps,
              completedStepColor: Colors.blue,
              activeStepColor: const Color(0xffdbecff),
              inactiveStepColor: const Color(0xffbababa),
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
              child: const Text('Back'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_currentStep < _totalSteps) _currentStep++;
                });
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}
