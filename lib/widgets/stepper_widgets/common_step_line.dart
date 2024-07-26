import 'package:flutter/material.dart';

class CommonStepLine extends StatelessWidget {
  final Color lineColor;
  final double lineWidth;

  const CommonStepLine({
    super.key,
    required this.lineColor,
    required this.lineWidth,
  });

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
