import 'package:flutter/material.dart';
import 'package:mobx_cart_list/body.dart';
import 'package:mobx_cart_list/controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              return Text(controller.isValid
                  ? 'Formulário Validado'
                  : 'Formulário não validado');
            },
          ),
        ),
        body: BodyWidget());
  }
}
