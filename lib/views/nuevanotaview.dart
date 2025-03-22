import 'package:flutter/material.dart';
import 'package:notas/complementos/notas_provider.dart';
import 'package:provider/provider.dart';

class NuevaNotaView extends StatefulWidget{

  const NuevaNotaView({super.key});

  @override
  State<NuevaNotaView> createState() => _NuevaNotaViewState();
}

class _NuevaNotaViewState extends State<NuevaNotaView>{
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  @override
  Widget build (BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Crear Nueva Nota',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Titulo'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _contenidoController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Contenido'),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: (){
              if (_tituloController.text.isNotEmpty && _contenidoController.text.isNotEmpty) {
                Provider.of<NotasProvider>(context, listen: false).agregarNota(_tituloController.text, _contenidoController.text);
                // Navigator.pop(context);
                _tituloController.clear();
                _contenidoController.clear();
              }
            },
            icon: const Icon(Icons.save),
             label: const Text('Guardar Nota')
          ),
        ],
      ),
    );
  }
}