import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projeto_2_cards/models/app_bloc.dart';
import 'package:projeto_2_cards/models/card.dart';
import 'package:projeto_2_cards/pages/login_page.dart';
import 'package:projeto_2_cards/routes/routes.dart';
import 'package:projeto_2_cards/services/cards_service.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  List<Cartao> cards;
  Future<List<Cartao>> getCards;
  CardsService cardsService = CardsService();

  @override
  void initState() {
    super.initState();
    getCards = cardsService.buscarTodosCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.only(left: 15.0, top: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Color.fromRGBO(43, 56, 91, .4),
                      child: Icon(
                        Icons.perm_identity,
                        size: 60,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Text(
                      AppBloc.user.email,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      AppBloc.user.name,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(43, 56, 91, 1),
                ),
              ),
              ListTile(
                title: Text('Sair'),
                onTap: () {
                  AppBloc.user = null;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Cards'),
          backgroundColor: Color.fromRGBO(43, 56, 91, 1),
          actions: [
            GestureDetector(
              child: Icon(Icons.add),
              onTap: () async {
                var cardCreated = await Navigator.of(context)
                    .pushNamed(Routes.CREATE_CARD_PAGE);

                if (cardCreated != null) {
                  setState(() {
                    cards.add(cardCreated);
                  });
                }
              },
            ),
            SizedBox(
              width: 15.0,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: getCards,
            builder: (context, AsyncSnapshot<List<Cartao>> snapshot) {
              if (!snapshot.hasData) {
                print('nao tem data');
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                print('tem erro');

                return Center(child: Text("${snapshot.error}"));
              }
              cards = snapshot.data;
              cards.forEach((element) {
                print(element);
              });
              return ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  var card = cards[index];
                  return Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(55.5),
                          side: BorderSide(color: Colors.red)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).accentColor),
                                  child: Text('1'),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      card.title ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                            endIndent: 10,
                            indent: 10,
                          )
                        ],
                      ),
                    ),
                  );
                  // return Card(
                  //   color: Colors.white,
                  // );

                  //           return ListTile(
                  //             leading: Icon(Icons.supervised_user_circle),
                  //             title: Text(card.title ?? ''),
                  //             onTap: () async {
                  //               var cardUpdated = await Navigator.of(context).pushNamed(
                  //                 Routes.CREATE_CARD_PAGE,
                  //                 arguments: card,
                  //               );

                  //               if (cardUpdated != null) {
                  //                 setState(() {
                  //                   card = cardUpdated;
                  //                 });
                  //               }
                  //             },
                  //             onLongPress: () async {
                  //               var deleted = await cardsService.delete(card);
                  //               if (deleted) {
                  //                 setState(() {
                  //                   cards.remove(card);
                  //                 });
                  //               }
                  //             },
                  //           );
                },
              );
            },
          ),
        ));
  }
}
