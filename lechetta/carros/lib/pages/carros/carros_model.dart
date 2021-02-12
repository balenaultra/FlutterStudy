import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:mobx/mobx.dart';

part 'carros_model.g.dart';

class CarrosModel = CarrosModelBase with _$CarrosModel;

abstract class CarrosModelBase with Store {
  @observable
  List<Carro> carros;

  @observable
  Exception error;

  @action
  Future<List<Carro>> fetch(String tipo) async {
    try {

      this.carros = await CarrosApi.getCarros(tipo);

      return carros;
    } catch (e) {
      error = e;
    }
  }

}
