import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or sign up with',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Fingerprint Icon.svg'),
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset('assets/Facebook Icon.svg'),
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset('assets/Google Icon.svg'),
          ],
        ),
      ],
    );
  }
}
