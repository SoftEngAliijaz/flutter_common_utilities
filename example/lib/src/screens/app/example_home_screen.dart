import 'package:example/src/screens/responsive_util/main/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import '../responsive_util/main/responsive_util_example.dart';
import '../stepper/stepper_example.dart';

class ExampleHomeScreen extends StatelessWidget {
  const ExampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Common Utilities Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Responsive Screens'),
              Tab(text: 'Stepper Example'),
              Tab(text: 'Responsive Grid View'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ResponsiveUtilExample(),
            StepperExample(),
            ResponsiveGridViewExample(),
          ],
        ),
      ),
    );
  }
}
