import 'package:flutter/material.dart';
import 'package:notas/complementos/nota_model.dart';

class NotasProvider with ChangeNotifier{
  final List<Nota> _notas = [];

  List<Nota> get notas => _notas;

  void agregarNota(String titulo, String contenido){
    _notas.add(Nota(titulo: titulo, contenido: contenido));
    notifyListeners();
  }

  void eliminarNota(int index){
    if(index >= 0 && index < _notas.length){
      _notas.removeAt(index);
      notifyListeners();
    }
  }
}