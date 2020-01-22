import 'package:flutter/material.dart';
import 'package:mobx_cart_list/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MobX',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
