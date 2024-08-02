import 'package:flutter/material.dart';

class ResponsiveUtil extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width >= 1921) {
      return desktop;
    } else if (width >= 801) {
      return desktop;
    } else if (width >= 451) {
      return tablet ?? desktop;
    } else if (width >= 0) {
      return mobileLarge ?? tablet ?? desktop;
    } else {
      return mobile;
    }
  }

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
    return width > 800 && width <= 1920;
  }

  static bool isDesktop(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > 1920;
  }
}
