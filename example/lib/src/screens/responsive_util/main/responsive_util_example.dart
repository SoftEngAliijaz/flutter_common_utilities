import 'package:example/src/screens/responsive_util/responsive_views/desktop_view.dart';
import 'package:example/src/screens/responsive_util/responsive_views/mobile_large_view.dart';
import 'package:example/src/screens/responsive_util/responsive_views/mobile_view.dart';
import 'package:example/src/screens/responsive_util/responsive_views/tablet_view.dart';
import 'package:example/widgets/responsive_util.dart';
import 'package:flutter/material.dart';

class ResponsiveUtilExample extends StatelessWidget {
  const ResponsiveUtilExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveUtil(
        mobile: MobileHomeScreen(),
        mobileLarge: MobileLargeHomeScreen(),
        tablet: TabletHomeScreen(),
        desktop: DesktopHomeScreen(),
      ),
    );
  }
}
