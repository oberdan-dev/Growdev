import 'package:dio/dio.dart';
import 'package:projeto_2_cards/models/card.dart';

class CardsService {
  Dio dio;

  CardsService()
      : dio = Dio(
          BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'),
        );

  void buscarTodosCards() async {
    Response<List> response = await dio.get('/cards',
        options: Options(headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjA4NTg5NjM2LCJleHAiOjE2MDg2NzYwMzZ9.0hnBDy-AbnlsxGAXr3d0iHaVoclP-jJXa3V7-xgmXlI'
        }));
    var lista = response.data.map((card) => Card.fromJson(card)).toList();
    lista.forEach((element) {
      print(element);
    });
    print(response);
  }
}
