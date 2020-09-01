import 'package:flutter/material.dart';
import 'package:loja_virtual/commons/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerTile(Icons.home, 'Início', 0,),
          DrawerTile(Icons.list, 'Produtos', 1,),
          DrawerTile(Icons.playlist_add_check, 'Meus pedidos', 2,),
          DrawerTile(Icons.location_on, 'Lojas', 3)

        ],
      ),
    );
  }
}
