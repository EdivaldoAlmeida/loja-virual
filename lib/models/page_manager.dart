import 'package:flutter/cupertino.dart';

/*
Classe gerenciadora de páginas, ela é responsável por mudar de páginas, para isso
ela recebe como parâmetro um valor (inteiro) que representa o número da página a
ser exibida (jumpToPage) na chamdada de seu método setPage()
 */

class PageManager{

  PageManager(this._pageController);

  PageController _pageController;

  int page = 0;

  void setPage(int value){
    if(value == page) return; //vendo se já estou na página que desejo ir
    page = value;
    _pageController.jumpToPage(value);
  }

}

