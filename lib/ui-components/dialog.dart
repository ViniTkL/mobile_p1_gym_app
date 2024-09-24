import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  bool isAlert = false;
  String title = '';
  String? subtitle = '';
  MyDialog({required this.isAlert, required this.title, this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return isAlert
        ? AlertDialog(
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
            title: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromRGBO(226, 241, 99, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            content: Text(subtitle!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              ),
            ],
          )
        : SimpleDialog(
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(226, 241, 99, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              ),
            ],
          );
  }
}
