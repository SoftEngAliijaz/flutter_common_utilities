import 'package:flutter/material.dart';
import 'src/screens/app/example_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Common Utilities Example',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const ExampleHomeScreen(),
    );
  }
}
