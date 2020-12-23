import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:projeto_2_cards/models/app_bloc.dart';
import 'package:projeto_2_cards/models/card.dart';

class CardsService {
  Dio dio;

  CardsService()
      : dio = Dio(
          BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'),
        );

  Future<List<Cartao>> buscarTodosCards() async {
    Response<List> response = await dio.get(
      '/cards',
      options: Options(
        headers: {'Authorization': 'Bearer ${AppBloc.user.token}'},
      ),
    );
    var lista = response.data.map((card) => Cartao.fromJson(card)).toList();

    return lista;
  }

  Future<Cartao> insereCards(Cartao card) async {
    Response response = await dio.post(
      '/cards',
      data: jsonEncode(card),
      options: Options(
        headers: {'Authorization': 'Bearer ${AppBloc.user.token}'},
      ),
    );

    print(response);

    return response.statusCode == 200
        ? Cartao.fromJson(response.data)
        : throw Error();
  }

  Future<Cartao> editarCards(Cartao card) async {
    Response response = await dio.put(
      '/cards/${card.id}',
      data: jsonEncode(card),
      options: Options(
        headers: {'Authorization': 'Bearer ${AppBloc.user.token}'},
      ),
    );

    print(response);

    return response.statusCode == 200
        ? Cartao.fromJson(response.data)
        : throw Error();
  }

  Future<bool> delete(Cartao card) async {
    Response response = await dio.delete(
      '/cards/${card.id}',
      options: Options(
        headers: {'Authorization': 'Bearer ${AppBloc.user.token}'},
      ),
    );

    print(response);
    print(response.statusCode);
    print(response.data);

    return response.statusCode == 200 ? true : throw Error();
  }
}
