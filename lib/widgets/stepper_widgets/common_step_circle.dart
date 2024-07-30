import 'package:flutter/material.dart';

class CommonStepCircle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration: BoxDecoration(
        color: circleColor,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: innerWidget,
    );
  }
}
