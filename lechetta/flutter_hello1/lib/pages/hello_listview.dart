import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: (){
            setState(() {
              gridView = false;
            });
          }),
          IconButton(icon: Icon(Icons.grid_on), onPressed: (){
            setState(() {
              gridView = true;
            });
          }),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Beagle", "assets/images/dog1.png"),
      Dog("Pitbull", "assets/images/dog2.png"),
      Dog("Labrador", "assets/images/dog3.png"),
      Dog("SRD1", "assets/images/dog4.png"),
      Dog("SRD2", "assets/images/dog5.png"),
    ];

    if (gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index){
    Dog dog = dogs[index];
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _img(dog.foto),
        Container(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              dog.nome,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _img(String text) {
    return Image.asset(
      text,
      fit: BoxFit.cover,
    );
  }
}
