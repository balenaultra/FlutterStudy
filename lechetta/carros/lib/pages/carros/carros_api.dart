import 'dart:convert' as convert;
import 'package:carros/api_response.dart';
import 'package:carros/pages/carros/carro.dart';
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

      var url =
          'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

      var response = await http.get(url, headers: headers);

      print("GET >> $url");

      String json = response.body;

      List list = convert.json.decode(json);

      List<Carro> carros =
      list.map<Carro>((map) => Carro.fromMap(map)).toList();

      return carros;
    } catch (error, exception) {
      print("$error > $exception");
      throw error;
    }
  }

  static Future<ApiResponse<bool>> save(Carro c) async {
    try {
      Usuario user = await Usuario.get();

      Map<String, String> headers = {
        "Content-Type": "Application/json",
        "Authorization": "Bearer ${user.token}",
      };

      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      if (c.id != null) {
        url += "/${c.id}";
      }

      print("URL > $url");

      String json = c.toJson();

      print("Body: ${json}");
      print("Headers: ${headers}");

      var response = await (c.id == null
          ? http.post(url, body: json, headers: headers)
          : http.put(url, body: json, headers: headers));

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        Map mapResponse = convert.json.decode(response.body);

        c = Carro.fromMap(mapResponse);

        print("Novo carro: ${c.id}");

        return ApiResponse.ok(true);
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error("Não foi possível salvar o carro");
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(
          mapResponse["error"] ?? "Não foi possível salvar o carro");
    } catch (e) {
      print(e);
      return ApiResponse.error("Não foi possível salvar o carro");
    }
  }
}
