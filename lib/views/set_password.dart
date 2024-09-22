import 'package:flutter/material.dart';
import 'package:prova_p1_mobile/ui-components/auth_footer.dart';
import 'package:prova_p1_mobile/ui-components/auth_header.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/ui-components/forgot_password_form.dart';
import 'package:prova_p1_mobile/ui-components/form_input.dart';
import 'package:prova_p1_mobile/ui-components/set_password_form.dart';
import 'package:prova_p1_mobile/views/login.dart';

class SetPassword extends StatelessWidget {
  TextEditingController password = TextEditingController(text: '');
  TextEditingController confirmPassword = TextEditingController(text: '');
  SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),
          centerTitle: true,
          title: const Text(
            'Set Password',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color.fromRGBO(226, 241, 99, 1)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(226, 241, 99, 1),
              )),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
              ),
              AuthHeader(
                pageTitle: "",
                pageSubtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(179, 160, 255, 1)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormInput(
                          controller: password,
                          label: 'Password',
                          placeholder: '*************',
                          isPassword: true),
                      FormInput(
                          controller: confirmPassword,
                          label: 'Confirm Password',
                          placeholder: '*************',
                          isPassword: true),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Button(
                  function: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  isTransparent: false,
                  text: 'Reset Password'),
            ],
          ),
        ),
      ),
    );
  }
}
