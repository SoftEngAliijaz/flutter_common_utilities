import 'package:flutter/material.dart';
import 'package:flutter_common_utilities/flutter_common_utilities.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 1;
  final int _totalSteps = 5;

  void _goToPreviousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _goToNextStep() {
    if (_currentStep < _totalSteps) {
      setState(() {
        _currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                onPressed: _goToPreviousStep,
                child: const Text('Back'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _goToNextStep,
                child: const Text('Next'),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
