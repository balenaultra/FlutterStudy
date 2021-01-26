import 'dart:convert' as convert;

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    try {
      Usuario user = await Usuario.get();

      Map<String, String> headers = {
        "Content-Type": "Application/json",
        "Authorization": "Bearer ${user.token}",
      };

      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

      var response = await http.get(url, headers: headers);

      String json = response.body;

      List list = convert.json.decode(json);

      return list.map<Carro>((map) => Carro.fromJson(map)).toList();
    } catch (error, exception) {
      print("$error > $exception");
      throw error;
    }
  }
}
