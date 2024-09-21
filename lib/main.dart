import 'package:flutter/material.dart';
import 'package:prova_p1_mobile/views/forgot_password.dart';
import 'package:prova_p1_mobile/views/launch.dart';
import 'package:prova_p1_mobile/views/login.dart';
import 'package:prova_p1_mobile/views/on_boarding.dart';
import 'package:prova_p1_mobile/views/set_password.dart';
import 'package:prova_p1_mobile/views/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SetPassword(),
    );
  }
}
