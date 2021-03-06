import 'dart:convert' as convert;
import 'dart:io';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/upload_service.dart';
import 'package:carros/utils/http_helper.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    try {

      var url =
          Uri.parse('https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');

      var response = await http.get(url);

      print("GET >> $url");

      String json = response.body;
      //print("json >> $json");

      List list = convert.json.decode(json);

      List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

      return carros;
    } catch (error, exception) {
      print("$error > $exception");
      throw error;
    }
  }

  static Future<ApiResponse<bool>> save(Carro c, File file) async {
    try {

      if (file != null) {
        ApiResponse<String> response = await UploadApi.upload(file);
        if (response.ok) {
          String urlFoto = response.result;
          c.urlFoto = urlFoto;
        }
      }

      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      if (c.id != null) {
        url += "/${c.id}";
      }

      print("URL > $url");

      String json = c.toJson();

      var response = await (c.id == null
          ? http.post(Uri.parse(url), body: json)
          : http.put(Uri.parse(url), body: json));

      if (response.statusCode == 201 || response.statusCode == 200) {
        Map mapResponse = convert.json.decode(response.body);

        c = Carro.fromMap(mapResponse);

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

  static Future<ApiResponse<bool>> delete(Carro carro) async {
    try {

      var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/carros/${carro.id}');

      print("URL > $url");

      var response = await http.delete(url);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {

        print("Carro removido: ${carro.id}");

        return ApiResponse.ok(true);
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error("Não foi possível remover o carro");      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(
          mapResponse["error"] ?? "Não foi possível remover o carro");
    } catch (e) {
      print(e);
      return ApiResponse.error("Não foi possível remover o carro");
    }
  }
}
