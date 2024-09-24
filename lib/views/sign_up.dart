import 'package:flutter/material.dart';
import 'package:prova_p1_mobile/ui-components/auth_footer.dart';
import 'package:prova_p1_mobile/ui-components/auth_header.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/ui-components/dialog.dart';
import 'package:prova_p1_mobile/ui-components/form_input.dart';
import 'package:prova_p1_mobile/utils/auth.dart';
import 'package:prova_p1_mobile/utils/vailidators.dart';
import 'package:prova_p1_mobile/views/login.dart';

class SignUp extends StatelessWidget {
  TextEditingController fullName = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController confirmPassword = TextEditingController(text: '');
  Auth user = Auth();
  SignUp({super.key});

  bool validateEmail() {
    return validEmail(email.text) && email.text.isNotEmpty;
  }

  bool validatePassword() {
    if (confirmPassword.text.isNotEmpty && password.text.isNotEmpty)
      return confirmPassword.text == password.text;
    return false;
  }

  void createUser(context) async {
    if (validateEmail() && validatePassword() && fullName.text.isNotEmpty) {
      user.saveUser(fullName.text, email.text, password.text);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(
              isAlert: false, title: 'Usuário registrado com sucesso :)!!!');
        },
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
            isAlert: true,
            title: 'Credenciais inválidas',
            subtitle:
                'Por favor, insira valores válidos para poder criar seu usuário');
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
            'Create Account',
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AuthHeader(pageTitle: "Let's Start!"),
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
                          controller: fullName,
                          label: 'Full name',
                          placeholder: 'Your Name...',
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          controller: email,
                          label: 'Email',
                          placeholder: 'example@example.com',
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          controller: password,
                          label: 'Password',
                          placeholder: '*************',
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          controller: confirmPassword,
                          label: 'Confirm Password',
                          placeholder: '*************',
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'By continuing, you agree to\nTerms of Use and Privacy Policy.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Button(
                    function: () => createUser(context),
                    isTransparent: false,
                    text: 'Sign Up'),
                SizedBox(
                  height: 15,
                ),
                AuthFooter(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Color.fromRGBO(226, 241, 99, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
