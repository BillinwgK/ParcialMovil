import 'package:flutter/material.dart';

class Punto1Screen extends StatefulWidget{
  const Punto1Screen({super.key});

  @override
  State<StatefulWidget> createState(){
    return _ConversionScreen();
  }
}

class _ConversionScreen extends State<Punto1Screen>{
  @override
  final TextEditingController _celsiusController = TextEditingController();
  String _selectedConversion = 'Celsius a Rankine';
  String _result = '';

  void _convert() {
    double celsius = double.tryParse(_celsiusController.text) ?? 0 ;
    double rankine;

    if (_selectedConversion == 'Celsius a Rankine') {
      rankine = celsius * (9 / 5) +  491.67; 
    } else {
      rankine = celsius;
      celsius = (rankine - 491.67) * 5 / 9;   
    }
    setState(() {
      _result = 'Celsius: ${celsius.toStringAsFixed(2)}\nRankine: ${rankine.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Conversor Celsius - Rankine")
        ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 206, 229, 251),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _celsiusController,
                    decoration: InputDecoration(
                      labelText: 'Ingresa el valor',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(Icons.thermostat, color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedConversion,
                    decoration: InputDecoration(
                      labelText: 'Tipo de conversión',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: 
                        ['Celsius a Rankine', 'Rankine a Celsius'].map((label) {
                          return DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedConversion = value!;
                      });
                    },
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _convert,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 73, 140, 248),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Convertir',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Resultado:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 10, 15),
              ),
            ),
            SizedBox(height: 8),
            Text(
              _result,
              style:TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 9, 9, 12),
              ),
            ),
          ],
        ),
    );
  }
}