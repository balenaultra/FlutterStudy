import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'carro_page.dart';

class CarrosListView extends StatelessWidget {
  final List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Container(
            height: 380,
            child: InkWell(
              onTap: () {
                _onClickCarro(context, c);
              },
              child: Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          height: 280,
                          imageUrl: c.urlFoto ??
                              "https://cdn5.vectorstock.com/i/1000x1000/64/29/generic-brown-sedan-car-isolated-on-white-vector-13216429.jpg",
                        ),
                      ),
                      Text(
                        c.nome ?? "Carro sem nome",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "descrição.. ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                      ButtonBarTheme(
                        data: ButtonBarTheme.of(context),
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('DETALHES'),
                              onPressed: () => _onClickCarro(context, c),
                            ),
                            FlatButton(
                              child: const Text('SHARE'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(BuildContext context, Carro carro) {
    push(context, CarroPage(carro));
  }
}
