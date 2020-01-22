// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$nomeAtom = Atom(name: 'ControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$sobreNomeAtom = Atom(name: 'ControllerBase.sobreNome');

  @override
  String get sobreNome {
    _$sobreNomeAtom.context.enforceReadPolicy(_$sobreNomeAtom);
    _$sobreNomeAtom.reportObserved();
    return super.sobreNome;
  }

  @override
  set sobreNome(String value) {
    _$sobreNomeAtom.context.conditionallyRunInAction(() {
      super.sobreNome = value;
      _$sobreNomeAtom.reportChanged();
    }, _$sobreNomeAtom, name: '${_$sobreNomeAtom.name}_set');
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic changeName(String newName) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.changeName(newName);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSobreNome(String newSobreNome) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.changeSobreNome(newSobreNome);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
