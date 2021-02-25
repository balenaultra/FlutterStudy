// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorito_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritoModel on FavoritoModelBase, Store {
  final _$favoritoAtom = Atom(name: 'FavoritoModelBase.favorito');

  @override
  Favorito get favorito {
    _$favoritoAtom.reportRead();
    return super.favorito;
  }

  @override
  set favorito(Favorito value) {
    _$favoritoAtom.reportWrite(value, super.favorito, () {
      super.favorito = value;
    });
  }

  final _$errorAtom = Atom(name: 'FavoritoModelBase.error');

  @override
  Exception get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('FavoritoModelBase.fetch');

  @override
  Future fetch(Carro carro) {
    return _$fetchAsyncAction.run(() => super.fetch(carro));
  }

  @override
  String toString() {
    return '''
favorito: ${favorito},
error: ${error}
    ''';
  }
}
