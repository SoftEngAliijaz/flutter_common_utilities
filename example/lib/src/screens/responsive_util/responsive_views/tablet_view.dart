import 'package:flutter/material.dart';

class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tablet Home Screen'));
  }
}
