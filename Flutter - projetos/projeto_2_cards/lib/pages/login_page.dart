import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_2_cards/models/app_bloc.dart';
import 'package:projeto_2_cards/routes/routes.dart';
import 'package:projeto_2_cards/services/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

@override
void initState() {
  // TODO: implement initState
  if (AppBloc.user != null) {
    BuildContext context;
        Navigator.pushNamed(context, Routes.CARDS_PAGE);
  }
}

class _LoginPageState extends State<LoginPage> {
  bool isEnabled = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthenticationService authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(43, 56, 91, 1),
      body: Padding(
        padding: EdgeInsets.only(
          top: 40,
          right: 10,
          left: 10,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.deepPurple,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 70),
                  Image.asset(
                    'assets/growdev_branco.png',
                    fit: BoxFit.contain,
                    width: 150,
                    height: 100,
                  ),
                  SizedBox(height: 40),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Novo por aqui? ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // NAVEGUE AQUI
                            },
                          text: 'Crie a sua conta aqui',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF2711C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffix: Icon(Icons.mail, color: Colors.black38),
                      filled: true,
                      fillColor: Color.fromRGBO(43, 56, 91, .7),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffix: Icon(Icons.remove_red_eye_rounded,
                          color: Colors.black38),
                      filled: true,
                      fillColor: Color.fromRGBO(43, 56, 91, .7),
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      GestureDetector(
                          child: Container(
                            height: 35,
                            width: 35,
                            color: Color.fromRGBO(43, 56, 91, .7),
                            child: isEnabled
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                : null,
                          ),
                          onTap: () {
                            setState(() {
                              isEnabled = !isEnabled;
                            });
                          }),
                      SizedBox(width: 15),
                      Text(
                        'Mantenha-me conectado',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () async {
                      await authenticationService.login(
                          _emailController.text, _passwordController.text);
                      print(AppBloc.user);
                      if (AppBloc.user != null) {
                        Navigator.pushNamed(context, Routes.CARDS_PAGE);
                      }
                      print('salvou usuario');
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
