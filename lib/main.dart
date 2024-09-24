import 'package:flutter/material.dart';
import 'package:prova_p1_mobile/views/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: OnBoarding(),
    );
  }
}
