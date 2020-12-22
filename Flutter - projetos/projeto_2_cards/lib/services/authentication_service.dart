import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_2_cards/models/app_bloc.dart';
import 'package:projeto_2_cards/models/user.dart';

class AuthenticationService {
  Dio dio;
  AuthenticationService()
      : dio = Dio(
          BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'),
        );

  Future<User> login(email, password) async {
    try {
      Response response = await dio
          .post("/login", data: {'email': email, 'password': password});
      User user = User.fromJson(response.data);
      if (user != null) {
        AppBloc.user = user;
      }
    } catch (e) {
      print(e);
      return e;
    }

    void register() async {
      print('register');
    }
  }
}
