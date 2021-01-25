import 'package:carros/pages/carro/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    final carros = List<Carro>();

    await Future.delayed(Duration(seconds: 2));

    carros.add(Carro(nome: 'Lamborghini2 Reventon 2', urlFoto: 'https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/luxo/Lamborghini_Reventon.png'));
    carros.add(Carro(nome: 'Opala 788', urlFoto: 'https://storage.googleapis.com/carros-flutterweb.appspot.com/image_picker8358122735247866734.jpg'));
    carros.add(Carro(nome: 'MacKenn', urlFoto: 'https://storage.googleapis.com/carros-flutterweb.appspot.com/Mcqueen-3.png'));

    return carros;
  }
}