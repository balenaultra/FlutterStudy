import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/pages/carros/carro_dao.dart';
import 'package:carros/utils/network.dart';
import 'package:mobx/mobx.dart';

part 'carros_model.g.dart';

class CarrosModel = CarrosModelBase with _$CarrosModel;

abstract class CarrosModelBase with Store {

  @observable
  List<Carro> carros;

  @observable
  Exception error;

  @action
  fetch(String tipo) async {

    bool networkOn = await isNetworkOn();
    print(networkOn);

    try {
      if (!networkOn) {
        this.carros = await CarroDAO().findAllByTipo(tipo);
        return carros;
      }

      this.carros = await CarrosApi.getCarros(tipo);

      if (this.carros.isNotEmpty) {
        final dao = CarroDAO();
        carros.forEach(dao.save);
      }

      return carros;

    } catch (e) {
      error = e;
    }
  }

}
