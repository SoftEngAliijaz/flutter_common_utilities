import 'package:flutter/material.dart';
import 'package:flutter_common_utilities/widgets/stepper_widgets/common_step_circle.dart';
import 'package:flutter_common_utilities/widgets/stepper_widgets/common_step_line.dart';

class FlutterCommonStepper extends StatefulWidget {
  final double width;
  final int totalSteps;
  final int currentStep;
  final Color completedStepColor;
  final Color activeStepColor;
  final Color inactiveStepColor;
  final double lineWidth;

  const FlutterCommonStepper({
    super.key,
    required this.width,
    required this.currentStep,
    required this.completedStepColor,
    required this.totalSteps,
    required this.inactiveStepColor,
    required this.activeStepColor,
    required this.lineWidth,
  }) : assert(currentStep > 0 && currentStep <= totalSteps + 1);

  @override
  FlutterCommonStepperState createState() => FlutterCommonStepperState();
}

class FlutterCommonStepperState extends State<FlutterCommonStepper> {
  int? currentStep;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    currentStep = widget.currentStep;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      width: widget.width,
      child: Row(
        children: _buildSteps(),
      ),
    );
  }

  List<Widget> _buildSteps() {
    List<Widget> steps = [];
    for (int i = 0; i < widget.totalSteps; i++) {
      var circleColor = _getCircleColor(i);
      var borderColor = _getBorderColor(i);
      var lineColor = _getLineColor(i);

      steps.add(
        CommonStepCircle(
          index: i,
          circleColor: circleColor,
          borderColor: borderColor,
          lineWidth: widget.lineWidth,
          innerWidget: _getInnerWidget(i),
        ),
      );

      if (i != widget.totalSteps - 1) {
        steps.add(
          CommonStepLine(
            lineColor: lineColor,
            lineWidth: widget.lineWidth,
          ),
        );
      }
    }
    return steps;
  }

  Widget _getInnerWidget(int index) {
    if (index + 1 < currentStep!) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      );
    } else if (index + 1 == currentStep) {
      return Center(
        child: Text(
          '$currentStep',
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color _getCircleColor(int index) {
    if (index + 1 < currentStep!) {
      return widget.completedStepColor;
    } else if (index + 1 == currentStep) {
      return widget.activeStepColor;
    } else {
      return Colors.white;
    }
  }

  Color _getBorderColor(int index) {
    if (index + 1 < currentStep!) {
      return widget.completedStepColor;
    } else if (index + 1 == currentStep) {
      return widget.activeStepColor;
    } else {
      return widget.inactiveStepColor;
    }
  }

  Color _getLineColor(int index) {
    return currentStep! > index + 1
        ? Colors.blue.withOpacity(0.4)
        : Colors.grey[200]!;
  }

  void moveToNextStep() {
    if (currentStep! < widget.totalSteps) {
      setState(() {
        currentStep = (currentStep! + 1);
        if (currentStep! > widget.totalSteps) {
          isCompleted = true;
        }
      });
    }
  }

  void moveToPreviousStep() {
    if (currentStep! > 1) {
      setState(() {
        currentStep = (currentStep! - 1);
      });
    }
  }

  void goToStep(int step) {
    setState(() {
      currentStep = step;
      if (currentStep! > widget.totalSteps) {
        isCompleted = true;
      }
    });
  }
}
