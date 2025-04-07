import 'package:flutter/material.dart';
import 'package:punto_2/screens/punto1_screen.dart';
import 'package:punto_2/screens/punto2_screen.dart';
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
            children: [Punto1Screen(), Punto2(), Punto3Screen()],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.thermostat), text: 'Temperatura'),
              Tab(icon: Icon(Icons.rocket_launch), text: 'Distancia'),
              Tab(icon: Icon(Icons.scale), text: 'Peso'),
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
