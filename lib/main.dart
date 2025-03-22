import 'package:flutter/material.dart';
import 'package:notas/complementos/notas_provider.dart';
import 'package:notas/views/notasview.dart';
import 'package:notas/views/nuevanotaview.dart';
import 'package:notas/views/perfilview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotasProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Notas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: const HomePage(title: '',),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PaginaNotas(),
    const NuevaNotaView(),
    const PaginaPerfil()
  ];

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: screenWidth >= 800,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.note_outlined),
                selectedIcon: Icon(Icons.note),
                label: Text('Notas'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add),
                selectedIcon: Icon(Icons.add_box),
                label: Text('Nueva Nota'),
              ),NavigationRailDestination(
                icon: Icon(Icons.person_2_outlined),
                selectedIcon: Icon(Icons.person),
                label: Text('Perfil'),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
            color: Colors.grey[300],
          ),
          Expanded(child: _pages[_selectedIndex])
        ],
      ),
    );
  }
}