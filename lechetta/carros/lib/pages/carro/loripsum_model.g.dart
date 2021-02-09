// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loripsum_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoripsumModel on LoripsumModelBase, Store {
  final _$loripsumAtom = Atom(name: 'LoripsumModelBase.loripsum');

  @override
  String get loripsum {
    _$loripsumAtom.reportRead();
    return super.loripsum;
  }

  @override
  set loripsum(String value) {
    _$loripsumAtom.reportWrite(value, super.loripsum, () {
      super.loripsum = value;
    });
  }

  final _$errorAtom = Atom(name: 'LoripsumModelBase.error');

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

  final _$fetchAsyncAction = AsyncAction('LoripsumModelBase.fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
loripsum: ${loripsum},
error: ${error}
    ''';
  }
}
