import 'package:flutter/material.dart';

class ResponsiveUtil extends StatefulWidget {
  const ResponsiveUtil({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.mobileLarge,
  });

  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  @override
  State<ResponsiveUtil> createState() => _ResponsiveUtilState();

  static bool isMobile(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width <= 450;
  }

  static bool isMobileLarge(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > 450 && width <= 800;
  }

  static bool isTablet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > 800 && width <= 1200;
  }

  static bool isDesktop(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > 1200;
  }
}

class _ResponsiveUtilState extends State<ResponsiveUtil> {
  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtil.isDesktop(context)) {
      return widget.desktop;
    } else if (ResponsiveUtil.isTablet(context)) {
      return widget.tablet ?? widget.desktop;
    } else if (ResponsiveUtil.isMobileLarge(context)) {
      return widget.mobileLarge ?? widget.tablet ?? widget.desktop;
    } else {
      return widget.mobile;
    }
  }
}
