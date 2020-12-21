import 'package:flutter/material.dart';
import 'package:projeto_2_cards/pages/cards_page.dart';
import 'package:projeto_2_cards/pages/login_page.dart';
import 'package:projeto_2_cards/routes/routes.dart';

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
      initialRoute: Routes.CARDS_PAGE,
      routes: {
        Routes.LOGIN: (context) => LoginPage(),
        Routes.CARDS_PAGE: (context) => CardsPage(),
      },
    );
  }
}
