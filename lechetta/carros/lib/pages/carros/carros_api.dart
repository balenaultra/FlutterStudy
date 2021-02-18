import 'dart:convert' as convert;

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
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

      print("GET >> $url");

      String json = response.body;

      List list = convert.json.decode(json);

      List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

      final dao = CarroDAO();
      //for (Carro c in carros) {
      //  dao.save(c);
      //}
      carros.forEach(dao.save);

      return carros;

    } catch (error, exception) {
      print("$error > $exception");
      throw error;
    }
  }
}
