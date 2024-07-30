import 'package:flutter/material.dart';

class CommonStepLine extends StatelessWidget {
  const CommonStepLine({
    super.key,
    required this.lineColor,
    required this.lineWidth,
  });

  final Color lineColor;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: lineWidth,
        color: lineColor,
      ),
    );
  }
}
