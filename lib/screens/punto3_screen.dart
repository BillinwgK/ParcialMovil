import 'package:flutter/material.dart';

class Punto3Screen extends StatefulWidget {
  const Punto3Screen({super.key});

  @override
  State<Punto3Screen> createState() => _Punto3ScreenState();
}

class _Punto3ScreenState extends State<Punto3Screen> {
  final TextEditingController newtonInputController = TextEditingController();

  double newton = 0;
  double libraFuerza = 0;

  void convertir() {
    if (newtonInputController.text.isEmpty) return;

    setState(() {
      newton = double.parse(newtonInputController.text);
      libraFuerza = newton * 0.220462;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text('Newtons a Libra Fuerza')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  keyboardType: TextInputType.number,
                  controller: newtonInputController,
                  decoration: InputDecoration(
                    hintText: 'Ingrese el valor a convertir',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade400),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade400),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade400, width: 2),
                    ),
                    prefixIcon: Icon(Icons.scale, color: Colors.blue.shade400),
                    filled: true,
                    fillColor: Colors.blue.shade50,
                  )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: convertir,
                child: Text('Convertir'),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$newton',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      TextSpan(
                        text: ' Newtons = ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      TextSpan(
                        text: '$libraFuerza',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      TextSpan(
                        text: ' Libra Fuerza',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}