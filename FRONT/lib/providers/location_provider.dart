import 'package:flutter/cupertino.dart';

class LocationProvider with ChangeNotifier{

  int _paginaActual = 0;

  int get paginaActual => _paginaActual;
  set paginaActual(int valor){
    _paginaActual = valor;

    notifyListeners();
  }
}