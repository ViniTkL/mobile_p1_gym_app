import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prova_p1_mobile/ui-components/auth_footer.dart';
import 'package:prova_p1_mobile/ui-components/auth_header.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/ui-components/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              LoginForm(),
              SizedBox(
                height: 20,
              ),
              Button(
                  function: () => print('clicou'),
                  text: 'Log in',
                  isTransparent: true),
              SizedBox(
                height: 20,
              ),
              AuthFooter(),
              Text(
                'Don\'t have an account? Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )),
    );
  }
}
