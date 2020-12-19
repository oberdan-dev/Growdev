import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      // // enabledBorder: OutlineInputBorder(
                      // //   borderSide: BorderSide(color: Colors.white),
                      // //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white),
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      GestureDetector(
                          child: Container(
                            height: 35,
                            width: 35,
                            color: Colors.grey,
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
                    onPressed: () {},
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
