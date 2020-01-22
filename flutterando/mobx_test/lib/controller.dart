import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String nome;

  @observable
  String sobreNome;

  @computed
  String get nomeCompleto => "$nome $sobreNome";

  @action
  changeName(String newName) {
    nome = newName;
  }

  @action
  changeSobreNome(String newSobreNome) {
    sobreNome = newSobreNome;
  }
}
