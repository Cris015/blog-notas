import 'package:flutter/material.dart';
import 'package:notas/complementos/notas_provider.dart';
import 'package:provider/provider.dart';

class PaginaNotas extends StatelessWidget{
  const PaginaNotas({super.key});


  @override
  Widget build(BuildContext context){
    final notasProvider = Provider.of<NotasProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mis notas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: notasProvider.notas.length,
              itemBuilder: (context, index){
                final nota = notasProvider.notas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(nota.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(nota.contenido),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        notasProvider.eliminarNota(index);
                      },
                    ),
                  ),
                );
              },
            )
          ),
        ],),
    );
  }
}