import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Balena"),
              accountEmail: Text("Balena@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog1.png"),
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
                onTap: () {
                  print("Opção 1");
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
