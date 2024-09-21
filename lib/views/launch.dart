import 'package:flutter/material.dart';
import 'package:prova_p1_mobile/ui-components/brand_logo.dart';

class Launch extends StatelessWidget {
  const Launch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(1, 35, 35, 35),
        body: BrandLogo(
          fontSize: 40,
        ));
  }
}
