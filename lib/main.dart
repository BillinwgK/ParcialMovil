import 'package:flutter/material.dart';
import 'package:punto_2/screens/punto3_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              Center(child: Text('Página de Inicio')),
              Center(child: Text('Página de Favoritos')),
              Punto3Screen(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.star), text: 'Favoritos'),
              Tab(icon: Icon(Icons.scale), text: 'N a LB'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
