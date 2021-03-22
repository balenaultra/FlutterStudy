import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'carro_page.dart';

class CarrosListView extends StatelessWidget {
  final List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];
          return Container(
            child: InkWell(
              onTap: () {
                _onClickCarro(context, c);
              },
              onLongPress: () {
                _onLongClickCarro(context, c);
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
                            TextButton(
                              child: const Text('DETALHES'),
                              onPressed: () => _onClickCarro(context, c),
                            ),
                            TextButton(
                              child: const Text('SHARE'),
                              onPressed: () {
                                _onClickShare(context, c);
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

  void _onLongClickCarro(BuildContext context, Carro c) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  c.nome,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text("Detalhes"),
                leading: Icon(Icons.directions_car),
                onTap: () {
                  pop(context);
                  _onClickCarro(context, c);
                },
              ),
              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share),
                onTap: () {
                  pop(context);
                  _onClickShare(context, c);
                },
              ),
            ],
          );
        });
  }

  void _onClickShare(BuildContext context, Carro c) {
    print("Share ${c.nome}");
    Share.share(c.urlFoto);
  }
}
