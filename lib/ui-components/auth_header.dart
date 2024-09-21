import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String pageTitle;
  final String? pageSubtitle;

  const AuthHeader({required this.pageTitle, this.pageSubtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(pageTitle,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w700,
                fontSize: 20)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            pageSubtitle ?? '',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
