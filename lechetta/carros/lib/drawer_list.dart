import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlFoto = "https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg";
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Balena"),
              accountEmail: Text("Balena@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(urlFoto),
              ),
            ),
            ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("Mais informações"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Opção 1");
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                subtitle: Text("Mais informações"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("Opção 1");
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
