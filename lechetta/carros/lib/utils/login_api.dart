import 'dart:convert';

import 'package:carros/api_response.dart';
import 'package:carros/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {
        "Content-Type": "Application/json",
      };

      final params = {"username": login, "password": senha};
      String s = json.encode(params);

      var response = await http.post(
        url,
        body: s,
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch(error, exception) {
      print("Erro no login $error");

      return ApiResponse.error("Não foi possível fazer o login.");
    }

  }
}
