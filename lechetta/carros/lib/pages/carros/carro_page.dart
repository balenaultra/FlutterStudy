import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/loripsum_model.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_model.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarroPage extends StatefulWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _modelLoripsum = LoripsumModel();
  final _modelFavorito = FavoritoModel();

  Carro get carro => widget.carro;

  @override
  void initState() {
    super.initState();

    _modelLoripsum.fetch();
    _modelFavorito.fetch(carro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopUpMenu(value),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),

                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: widget.carro.urlFoto,
          ),
          _bloco1(),
          Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(widget.carro.nome, fontSize: 20, bold: true),
            text(widget.carro.tipo, fontSize: 16),
          ],
        ),
        Row(
          children: [
            Observer(
              builder: (_) {
                Favorito favorito = _modelFavorito.favorito;

                print("Carro >> $carro");
                print("Favorito >> $favorito");
                //_modelFavorito.fetch(carro);

                return IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: favorito == null ? Colors.grey : Colors.red,
                    size: 40,
                  ),
                  onPressed: _onClickFavorito,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            ),
          ],
        )
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(widget.carro.descricao, bold: true),
        SizedBox(height: 20),
        Observer(
          builder: (_) {
            String loripsum = _modelLoripsum.loripsum;

            if (loripsum == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return text(loripsum);
          },
        ),
      ],
    );
  }

  _onClickPopUpMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar");
        break;
      case "Deletar":
        print("Deletar");
        break;
      case "Share":
        print("Share");
        break;
    }
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  void _onClickFavorito() async {
    bool favorito = await FavoritoService.favoritar(carro);
    _modelFavorito.fetch(carro);
  }

  void _onClickShare() {}
}
