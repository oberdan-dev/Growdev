import 'package:flutter/material.dart';
import 'package:projeto_2_cards/services/cards_service.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  List cards;
  CardsService cardsService = CardsService();

  @override
  void initState() {
    // TODO: implement initState
    cardsService.buscarTodosCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Card'),
            ],
          ),
        ));
  }
}
