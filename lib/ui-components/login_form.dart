import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(179, 160, 255, 1)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username or email',
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: 'example@example.com',
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: '*************',
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none),
            )
          ],
        ),
      ),
    );
  }
}
