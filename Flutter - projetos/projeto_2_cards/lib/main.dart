import 'package:flutter/material.dart';
import 'package:projeto_2_cards/models/app_bloc.dart';
import 'package:projeto_2_cards/pages/cards_page.dart';
import 'package:projeto_2_cards/pages/create_card_page.dart';
import 'package:projeto_2_cards/pages/login_page.dart';
import 'package:projeto_2_cards/routes/routes.dart';
import 'package:projeto_2_cards/theme/appTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: AppBloc.user == null ? Routes.LOGIN : Routes.CARDS_PAGE,
      routes: {
        Routes.LOGIN: (context) => LoginPage(),
        Routes.CARDS_PAGE: (context) => CardsPage(),
        Routes.CREATE_CARD_PAGE: (context) => CreateCardPage(),
      },
    );
  }
}
