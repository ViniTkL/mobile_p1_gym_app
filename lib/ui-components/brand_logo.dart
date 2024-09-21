import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandLogo extends StatelessWidget {
  final double fontSize;
  const BrandLogo({required this.fontSize,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/FB_Logo.svg'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FIT',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: fontSize,
                    color: const Color.fromRGBO(226, 241, 99, 1)),
              ),
              Text('BODY',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: fontSize,
                      color: const Color.fromRGBO(226, 241, 99, 1)))
            ],
          )
        ],
      );
  }
}
