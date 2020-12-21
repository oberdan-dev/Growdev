import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_2_cards/models/user.dart';

class AuthenticationService {
  Dio dio;
  AuthenticationService()
      : dio = Dio(
          BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'),
        );

  void login() async {
    try {
      Response response = await dio.post("/login",
          data: {'email': 'growdev@growdev.com', 'password': 'growdev@2020'});    
      print(response);
      print(response.data.runtimeType);
      print(response.data);
      print(response.data.toString());
      var json = jsonDecode(response.data);
      User user = User.fromJson(json);
      print(user);
    } catch (e) {
      print(e);
    }

    void register() async {
      print('register');
    }
  }
}
