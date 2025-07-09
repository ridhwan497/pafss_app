import 'package:flutter/material.dart';
import 'package:software_project_1/responsive/responsive_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(),
    );
  }
  
}