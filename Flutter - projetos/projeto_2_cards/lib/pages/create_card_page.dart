import 'package:flutter/material.dart';
import 'package:projeto_2_cards/models/app_bloc.dart';
import 'package:projeto_2_cards/models/card.dart';
import 'package:projeto_2_cards/pages/login_page.dart';
import 'package:projeto_2_cards/services/cards_service.dart';

class CreateCardPage extends StatefulWidget {
  @override
  _CreateCardPageState createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Cartao card;
  CardsService cardsService = CardsService();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    card = (ModalRoute.of(context).settings?.arguments as Cartao) ?? Cartao();
  }

  void save() async {
    if (!_formKey.currentState.validate()) {
      showSnackBar(
        message: 'Fill the fields correctly!',
        color: Colors.red,
      );
      return;
    }
    _formKey.currentState.save();

    if (card.id != null) {
      print('card id != null');
      var updated = await cardsService.editarCards(card);
      if (updated == null) {
        showSnackBar(
          message: 'Card not updated!',
          color: Colors.red,
        );
        print('updatedcard = $card');
        return;
      }
    } else {
      print('card id == null');
      print(card);
      card = await cardsService.insereCards(card);
    }

    Navigator.of(context).pop(card);
  }

  void showSnackBar({String message, Color color}) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
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
        title: Text('CREATE CARD'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: card?.title,
                        decoration: InputDecoration(hintText: 'Body'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          card.title = value;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        initialValue: card?.content != null
                            ? card?.content.toString()
                            : '',
                        decoration: InputDecoration(hintText: 'Content'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          card.content = value;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                'Salvar',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: save,
            )
          ],
        ),
      ),
    );
  }
}
