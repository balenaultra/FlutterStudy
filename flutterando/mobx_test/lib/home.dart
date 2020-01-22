import 'package:flutter/material.dart';
import 'package:mobx_test/controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatelessWidget {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Test'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    onChanged: controller.changeName,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(labelText: 'Sobrenome'),
                    onChanged: controller.changeSobreNome,
                  ),
                  SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      return Text('${controller.nomeCompleto}');
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
