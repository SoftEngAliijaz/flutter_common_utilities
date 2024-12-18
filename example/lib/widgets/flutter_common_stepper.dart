import 'package:flutter/material.dart';
import 'package:flutter_common_utilities/widgets/stepper_widgets/common_step_circle.dart';
import 'package:flutter_common_utilities/widgets/stepper_widgets/common_step_line.dart';

class FlutterCommonStepper extends StatefulWidget {
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

  final Color activeStepColor;
  final Color completedStepColor;
  final int currentStep;
  final Color inactiveStepColor;
  final double lineWidth;
  final int totalSteps;
  final double width;

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
    if (currentStep! > index + 1) {
      return Colors.blue;
    } else {
      return Colors.grey[200]!;
    }
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
}
