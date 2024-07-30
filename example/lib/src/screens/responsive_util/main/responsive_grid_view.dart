import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  final double aspectRatio;
  final int crossAxisCountMobile;
  final int crossAxisCountTablet;
  final int crossAxisCountDesktop;

  ResponsiveGridView({
    required this.children,
    this.aspectRatio = 1.0,
    this.crossAxisCountMobile = 2,
    this.crossAxisCountTablet = 4,
    this.crossAxisCountDesktop = 6,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (width < 600) {
      crossAxisCount = crossAxisCountMobile; // Mobile
    } else if (width < 1200) {
      crossAxisCount = crossAxisCountTablet; // Tablet
    } else {
      crossAxisCount = crossAxisCountDesktop; // Desktop
    }

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return children[index];
        },
        childCount: children.length,
      ),
    );
  }
}

class ResponsiveGridViewExample extends StatelessWidget {
  const ResponsiveGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ResponsiveGridView(
            children: List.generate(
              20,
              (index) => Card(
                color: Colors.blue[(index % 9 + 1) * 100],
                child: Center(
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
