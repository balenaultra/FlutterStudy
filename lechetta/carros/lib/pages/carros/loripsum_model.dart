import 'dart:async';

import 'package:carros/pages/carros/loripsum.dart';
import 'package:mobx/mobx.dart';

part 'loripsum_model.g.dart';

class LoripsumModel = LoripsumModelBase with _$LoripsumModel;

abstract class LoripsumModelBase with Store {
  static String lorim;

  @observable
  String loripsum;

  @observable
  Exception error;

  @action
  fetch() async {
    try {

      this.loripsum = lorim ?? await LoripsumApi.getLoripsum();

      lorim = this.loripsum;

    } catch (e) {
      error = e;
    }
  }

}
