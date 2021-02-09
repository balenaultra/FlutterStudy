import 'dart:async';

import 'package:carros/pages/carro/loripsum.dart';
import 'package:mobx/mobx.dart';

part 'loripsum_model.g.dart';

class LoripsumModel = LoripsumModelBase with _$LoripsumModel;

abstract class LoripsumModelBase with Store {
  @observable
  String loripsum;

  @observable
  Exception error;

  @action
  fetch() async {
    try {

      this.loripsum = await LoripsumApi.getLoripsum();

    } catch (e) {
      error = e;
    }
  }

}
