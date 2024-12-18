import 'package:flutter/material.dart';

class ResponsiveUtil extends StatefulWidget {
  const ResponsiveUtil({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.mobileLarge,
  });

  static const int mobileBreakpoint = 500;
  static const int mobileLargeBreakpoint = 700;
  static const int tabletBreakpoint = 1024;

  final Widget? desktop;
  final Widget? mobile;
  final Widget? mobileLarge;
  final Widget? tablet;

  @override
  State<ResponsiveUtil> createState() => _ResponsiveUtilState();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileBreakpoint;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileLargeBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
}

class _ResponsiveUtilState extends State<ResponsiveUtil> {
  Widget _getResponsiveWidget(Size size, Orientation orientation) {
    if (size.width >= ResponsiveUtil.tabletBreakpoint) {
      return widget.desktop!;
    } else if (size.width >= ResponsiveUtil.mobileLargeBreakpoint &&
        widget.tablet != null) {
      return widget.tablet!;
    } else if (size.width >= ResponsiveUtil.mobileBreakpoint &&
        widget.mobileLarge != null) {
      return widget.mobileLarge!;
    } else {
      return widget.mobile!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _getResponsiveWidget(size, orientation),
    );
  }
}
