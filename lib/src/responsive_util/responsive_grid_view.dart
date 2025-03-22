import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({
    super.key,
    required this.children,
    this.aspectRatio = 1.0,
    this.crossAxisCountMobile = 2,
    this.crossAxisCountTablet = 4,
    this.crossAxisCountDesktop = 6,
  });

  final double aspectRatio;
  final List<Widget> children;
  final int crossAxisCountDesktop;
  final int crossAxisCountMobile;
  final int crossAxisCountTablet;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (width < 600) {
      crossAxisCount = crossAxisCountMobile;
    } else if (width < 1200) {
      crossAxisCount = crossAxisCountTablet;
    } else {
      crossAxisCount = crossAxisCountDesktop;
    }

    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return children[index];
        }, childCount: children.length),
      ),
    );
  }
}

class ResponsiveGridViewExample extends StatelessWidget {
  const ResponsiveGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Grid View'),
      ),
      body: CustomScrollView(
        slivers: [
          ResponsiveGridView(
            children: List.generate(
              20,
              (index) => Card(
                color: Colors.blue[(index % 9 + 1) * 100],
                child: Center(
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
