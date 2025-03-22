import 'package:flutter/material.dart';
import 'package:flutter_common_utilities/flutter_common_utilities.dart';
import 'package:flutter_common_utilities/widgets/stepper_widgets/common_step_circle.dart';
import 'package:flutter_common_utilities/widgets/stepper_widgets/connector_line.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentStep = 1; // Current step in the stepper
  final int _totalSteps = 5; // Total number of steps in the stepper

  /// Moves to the next step if not at the last step
  void _nextStep() {
    if (_currentStep < _totalSteps) {
      setState(() {
        _currentStep++;
      });
    }
  }

  /// Moves to the previous step if not at the first step
  void _prevStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    }
  }

  /// Jumps to a specific step if within valid range
  void _jumpToStep(int step) {
    if (step >= 1 && step <= _totalSteps) {
      setState(() {
        _currentStep = step;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Stepper',
      home: Scaffold(
        appBar: AppBar(title: const Text('Dynamic Stepper')),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: ResponsiveUtil(
              mobile:
                  _buildVerticalStepper(context), // Vertical stepper for mobile
              tablet: _buildHorizontalStepper(
                  context), // Horizontal stepper for tablet
              desktop: _buildHorizontalStepper(
                  context), // Horizontal stepper for desktop
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a horizontal stepper (for tablet/desktop)
  Widget _buildHorizontalStepper(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(_totalSteps * 2 - 1, (index) {
              if (index % 2 == 0) {
                int stepIndex = index ~/ 2;
                return _buildStepCircle(stepIndex); // Step circle
              } else {
                return _buildStepConnector(index); // Step connector
              }
            }),
          ),
        ),
        const SizedBox(height: 40),
        _buildNavigationButtons(), // Navigation buttons
      ],
    );
  }

  /// Builds a vertical stepper (for mobile)
  Widget _buildVerticalStepper(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: List.generate(_totalSteps * 2 - 1, (index) {
              if (index % 2 == 0) {
                int stepIndex = index ~/ 2;
                return _buildStepCircle(stepIndex); // Step circle
              } else {
                return _buildVerticalConnector(
                    index); // Vertical step connector
              }
            }),
          ),
        ),
        const SizedBox(height: 20),
        _buildNavigationButtons(), // Navigation buttons
      ],
    );
  }

  /// Builds a step circle
  Widget _buildStepCircle(int stepIndex) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CommonStepCircle(
        index: stepIndex,
        circleColor: stepIndex < _currentStep ? Colors.blue : Colors.white,
        borderColor: stepIndex < _currentStep ? Colors.blue : Colors.grey,
        lineWidth: 2.0,
        innerWidget: Center(
          child: Text(
            '${stepIndex + 1}',
            style: TextStyle(
              color: stepIndex < _currentStep ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a horizontal step connector
  Widget _buildStepConnector(int index) {
    return SizedBox(
      width: 30,
      height: 4,
      child: StepperConnectorLine(
        lineColor: index ~/ 2 < _currentStep - 1 ? Colors.blue : Colors.grey,
        lineWidth: 4.0,
      ),
    );
  }

  /// Builds a vertical step connector
  Widget _buildVerticalConnector(int index) {
    return SizedBox(
      width: 4,
      height: 30,
      child: StepperConnectorLine(
        lineColor: index ~/ 2 < _currentStep - 1 ? Colors.blue : Colors.grey,
        lineWidth: 4.0,
      ),
    );
  }

  /// Builds navigation buttons
  Widget _buildNavigationButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _prevStep,
              child: const Text("Previous"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _nextStep,
              child: const Text("Next"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          children: List.generate(_totalSteps, (index) {
            return ElevatedButton(
              onPressed: () => _jumpToStep(index + 1),
              child: Text("Step ${index + 1}"),
            );
          }),
        ),
        const SizedBox(height: 20),
        const Text('Click buttons to navigate between steps'),
      ],
    );
  }
}
