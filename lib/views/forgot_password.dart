import 'package:flutter/material.dart';
import 'package:prova_p1_mobile/ui-components/auth_footer.dart';
import 'package:prova_p1_mobile/ui-components/auth_header.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/ui-components/forgot_password_form.dart';
import 'package:prova_p1_mobile/ui-components/form_input.dart';
import 'package:prova_p1_mobile/utils/vailidators.dart';
import 'package:prova_p1_mobile/views/set_password.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController email = TextEditingController(text: '');
  ForgotPassword({super.key});

  void continueToReset(context){
    if(validEmail(email.text) && email.text.isNotEmpty){
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => SetPassword()));
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('E-mail inválido'),
          content: Text('Por favor, insira um email válido'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

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
            'Forgot Password',
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
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
              ),
              AuthHeader(
                pageTitle: "Forgot Password?",
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
                          controller: email,
                          label: 'Enter your email address',
                          placeholder: 'example@example.com',
                          isPassword: false),
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
                  function: () => continueToReset(context),
                  isTransparent: false,
                  text: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }
}
