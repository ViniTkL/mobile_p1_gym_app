import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prova_p1_mobile/ui-components/auth_footer.dart';
import 'package:prova_p1_mobile/ui-components/auth_header.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/ui-components/form_input.dart';
import 'package:prova_p1_mobile/utils/vailidators.dart';
import 'package:prova_p1_mobile/views/forgot_password.dart';
import 'package:prova_p1_mobile/views/sign_up.dart';

class Login extends StatelessWidget {
  final TextEditingController password = TextEditingController(text: '');
  final TextEditingController email = TextEditingController(text: '');
  Login({super.key});

  bool emailValidator(TextEditingController email) {
    return validEmail(email.text) && email.text.isNotEmpty;
  }

  void login(context) {
    if (emailValidator(email) && password.text.isNotEmpty) {
      print('Deu bom');
      return;
    }

    print('Não deu bom');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Credenciais inválidas'),
          content: Text('Pro favor, tente novamente'),
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
              'Log in',
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AuthHeader(
                pageTitle: 'Welcome',
                pageSubtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(179, 160, 255, 1)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      FormInput(
                          controller: email,
                          label: 'Username or email',
                          placeholder: 'example@example.com',
                          isPassword: true),
                      SizedBox(
                        height: 20,
                      ),
                      FormInput(
                          controller: password,
                          label: 'Password',
                          placeholder: '*************',
                          isPassword: true),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword())),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                  function: () => login(context),
                  text: 'Log in',
                  isTransparent: false),
              SizedBox(
                height: 20,
              ),
              AuthFooter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp())),
                    child: Text(
                      'Sing Up',
                      style: TextStyle(
                          color: Color.fromRGBO(226, 241, 99, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
