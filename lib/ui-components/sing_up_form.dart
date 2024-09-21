import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController fullName = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController confirmPassword = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color.fromRGBO(179, 160, 255, 1)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Full name',
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            TextField(
              controller: fullName,
              decoration: InputDecoration(
                hintText: 'Your Name...',
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'example@example.com',
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
              ),
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
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Confirm Password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            TextField(
              controller: confirmPassword,
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
