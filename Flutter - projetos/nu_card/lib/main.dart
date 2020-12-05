import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class BackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(109, 33, 119, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 220,
        ),
        Positioned(
          top: 20,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 60,
            width: 390,
            color: Colors.white70,
            child: Text(
              'Assinatura',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          right: 35,
          left: 35,
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '9999 9999 9999 9999',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Image.asset(
                'cirrus.png',
                cacheWidth: 65,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FrontCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(109, 33, 119, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 220,
        ),
        Positioned(
          height: 60,
          right: 20,
          top: 20,
          child: Image.asset('mastercard.png'),
        ),
        Positioned(
          height: 50,
          left: 25,
          top: 75,
          child: Row(
            children: [
              Image.asset('chip.png'),
              SizedBox(width: 10),
              Image.asset(
                'nfc.png',
                color: Colors.white,
                cacheWidth: 20,
              ),
            ],
          ),
        ),
        Positioned(
          height: 80,
          left: 15,
          bottom: 10,
          child: Row(
            children: [
              Image.asset(
                'nu_logo.png',
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'OBERDAN C SANTOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(153, 51, 153, .5),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(109, 33, 119, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cartão do nubank'),
              Icon(Icons.credit_card),
            ],
          ),
        ),
        body: Center(
          child: FlipCard(
            front: FrontCard(),
            back: BackCard(),
          ),
        ),
      ),
    );
  }
}
