import 'package:flutter/material.dart';
import 'package:flutter_hello1/drawer_list.dart';
import 'package:flutter_hello1/pages/hello_listview.dart';
import 'package:flutter_hello1/pages/hello_page1.dart';
import 'package:flutter_hello1/pages/hello_page2.dart';
import 'package:flutter_hello1/pages/hello_page3.dart';
import 'package:flutter_hello1/utils/nav.dart';
import 'package:flutter_hello1/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          bottom: TabBar(tabs: [
            Tab(text: "Tab1"),
            Tab(text: "tab2"),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(color: Colors.red),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onClickFAB(),
          child: Icon(Icons.add),
        ),
        drawer: DrawerList(),
      ),
    );

  }

  _onClickFAB() {}

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
            _buttons(),
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

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: () => _onClickToast()),
              ],
            ),
          ],
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  print("OK!!");
                },
                child: Text("OK"),
              ),
            ],
            title: Text("Flutter é muito legal"),
          ),
        );
      },
    );
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá Flutter"),
        action: SnackBarAction(
          textColor: Colors.amber,
          label: "OK",
          onPressed: () {
            print("OK");
          },
        ),
      ),
    );
  }

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
