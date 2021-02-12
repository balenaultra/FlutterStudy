import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/pages/carros/carros_model.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'carro_page.dart';

class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  final _model = CarrosModel();

  String get tipo => widget.tipo;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _model.fetch(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (_) {
        List<Carro> carros = _model.carros;

        if (_model.error != null) {
          return TextError("Não foi possível buscar os carros");
        }
        if (carros == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _model.fetch(tipo);
  }
}
