import 'package:flutter/material.dart';
import 'package:notas/complementos/nota_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NotasProvider with ChangeNotifier{
  final List<Nota> _notas = [];

  List<Nota> get notas => _notas;

  NotasProvider() {
    _cargarNotas();
  }

  void agregarNota(String titulo, String contenido){
    _notas.add(Nota(titulo: titulo, contenido: contenido));
    _guardarNotas();
    notifyListeners();
  }

  void eliminarNota(int index){
    if(index >= 0 && index < _notas.length){
      _notas.removeAt(index);
      _guardarNotas();
      notifyListeners();
    }
  }
  Future<void> _guardarNotas() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notasJson = _notas.map((nota) => jsonEncode(nota.toJson())).toList();
    await prefs.setStringList('notas', notasJson);
  }

  Future<void> _cargarNotas() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? notasJson = prefs.getStringList('notas');
    if (notasJson != null) {
      _notas.addAll(notasJson.map((nota) => Nota.fromJson(jsonDecode(nota))));
    }
    notifyListeners();
  }
}