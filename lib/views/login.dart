import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/ui-components/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
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
            children: [
              LoginForm(),
              SizedBox(
                height: 20,
              ),
              Button(
                  function: (_) => print('clicou'),
                  text: 'Log in',
                  isTransparent: true),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'or sign up with',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
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
                  Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
