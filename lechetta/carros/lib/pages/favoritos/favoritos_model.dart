import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:mobx/mobx.dart';

part 'favoritos_model.g.dart';

class FavoritosModel = FavoritosModelBase with _$FavoritosModel;

abstract class FavoritosModelBase with Store {

  @observable
  List<Carro> carros;

  @observable
  Exception error;

  @action
  Future<List<Carro>> fetch() async {

    try {
      this.carros = await FavoritoService.getCarros();
      return carros;

    } catch (e) {
      error = e;
    }
  }

}
