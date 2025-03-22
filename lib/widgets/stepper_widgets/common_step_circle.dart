import 'package:flutter/material.dart';

class CommonStepCircle extends StatefulWidget {
  const CommonStepCircle({
    super.key,
    required this.index,
    required this.circleColor,
    required this.borderColor,
    required this.lineWidth,
    required this.innerWidget,
  });

  final Color borderColor;
  final Color circleColor;
  final int index;
  final Widget innerWidget;
  final double lineWidth;

  @override
  State<CommonStepCircle> createState() => _CommonStepCircleState();
}

class _CommonStepCircleState extends State<CommonStepCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration: BoxDecoration(
        color: widget.circleColor,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: widget.borderColor,
          width: 1.0,
        ),
      ),
      child: widget.innerWidget,
    );
  }
}
