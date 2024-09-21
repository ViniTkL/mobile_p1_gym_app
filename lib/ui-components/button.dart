import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Function function;
  String text;
  bool isTransparent;
  Button(
      {required this.function,
      required this.text,
      required this.isTransparent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 211,
      height: 44,
      child: ElevatedButton(
          style: ButtonStyle(
              side: WidgetStateBorderSide.resolveWith(
                (states) => const BorderSide(
                    color: Colors.white, width: 1.75, style: BorderStyle.solid),
              ),
              backgroundColor: isTransparent
                  ? WidgetStateColor.transparent
                  : WidgetStateColor.resolveWith(
                      (states) => Color.fromRGBO(255, 255, 255, 0.09))),
          onPressed: () {
            function();
          },
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 18),
          )),
    );
  }
}
