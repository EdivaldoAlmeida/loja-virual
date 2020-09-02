import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:provider/provider.dart';

/*
Classe que constroi um item do Drawer. Ela recebe um ícone, um texto e um
um int para identificar o número da página.
 */

class DrawerTile extends StatelessWidget {

  const DrawerTile(this.iconData, this.title, this.page);

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    //Obtendo a página atual através do PageManager.
    final int curPage = context.watch<PageManager>().page;

        return InkWell(
          onTap: (){
            //Ler o método setPage do PageManager, enviando o número da página
            context.read<PageManager>().setPage(page);
          },
          child: SizedBox(
            height: 60,
            child: Row(
      children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                  iconData,
                size: 32,
                color: curPage == page ? Colors.red : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700]
              ),
            )
      ],
    ),
          ),
        );
  }
}
