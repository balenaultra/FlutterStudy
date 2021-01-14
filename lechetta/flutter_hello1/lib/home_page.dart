import 'package:flutter/material.dart';
import 'package:flutter_hello1/pages/hello_listview.dart';
import 'package:flutter_hello1/pages/hello_page1.dart';
import 'package:flutter_hello1/pages/hello_page2.dart';
import 'package:flutter_hello1/pages/hello_page3.dart';
import 'package:flutter_hello1/utils/nav.dart';
import 'package:flutter_hello1/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _text(),
            _pageView(),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        height: 300,
        child: PageView(
          children: [
            _img("assets/images/dog1.png"),
            _img("assets/images/dog2.png"),
            _img("assets/images/dog3.png"),
            _img("assets/images/dog4.png"),
            _img("assets/images/dog5.png"),
          ],
        ));
  }

  _img(String text) {
    return Image.asset(
      text,
      fit: BoxFit.contain,
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlueButton("ListView",
                onPressed: () => _onClickNavigator(context, HelloListView())),
            BlueButton("Page2",
                onPressed: () => _onClickNavigator(context, HelloPage2())),
            BlueButton("Page3",
                onPressed: () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlueButton("Snack", onPressed: () => _onClickSnack),
            BlueButton("Dialog", onPressed: () => _onClickDialog),
            BlueButton("Toast", onPressed: () => _onClickToast),
          ],
        ),
      ],
    );
  }

  _onClickToast() {}
  _onClickDialog() {}
  _onClickSnack() {}

  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
      ),
    );
  }
}
