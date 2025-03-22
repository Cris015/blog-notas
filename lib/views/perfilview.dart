import 'package:flutter/material.dart';

class PaginaPerfil extends StatelessWidget {
  const PaginaPerfil({super.key});

  @override
  Widget build(BuildContext context){
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 16),
          const Text(
            "Usuario de prueba",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'usuario@ejemplo.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          Card(
            elevation: 2,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Total de Notas'),
                  trailing: Text('0', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: const Text('Última Actividad'),
                  trailing: Text('2025-02-01', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}