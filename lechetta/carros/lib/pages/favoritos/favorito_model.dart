import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';
import 'package:mobx/mobx.dart';

part 'favorito_model.g.dart';

class FavoritoModel = FavoritoModelBase with _$FavoritoModel;

abstract class FavoritoModelBase with Store {

  @observable
  Favorito favorito;

  @observable
  Exception error;

  @action
  fetch(Carro carro) async {
    try {
      this.favorito = await FavoritoDAO().findById(carro.id);

      return this.favorito;

    } catch (e) {
      error = e;
    }
  }

}
