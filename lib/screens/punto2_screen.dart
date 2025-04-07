import 'package:flutter/material.dart';

class Punto2 extends StatelessWidget {
  const Punto2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Astronómico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ConversionScreen(),
    );
  }
}

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({super.key});

  @override
  ConversionScreenState createState() => ConversionScreenState();
}

class ConversionScreenState extends State<ConversionScreen> {
  final TextEditingController yearsLuzController = TextEditingController();
  final TextEditingController uaController = TextEditingController();
  String selectedConversion = 'lyToUA';

  static const double uaPorAnioLuz = 63241.1;
  static const double anioLuzPorUa = 1 / uaPorAnioLuz;

  void convert() {
    if (selectedConversion == 'lyToUA') {
      if (yearsLuzController.text.isEmpty) return;

      final double yearsLuz = double.tryParse(yearsLuzController.text) ?? 0;
      final double ua = yearsLuz * uaPorAnioLuz;

      setState(() {
        uaController.text = ua.toStringAsFixed(4);
      });
    } else {
      if (uaController.text.isEmpty) return;

      final double ua = double.tryParse(uaController.text) ?? 0;
      final double yearsLuz = ua * anioLuzPorUa;

      setState(() {
        yearsLuzController.text = yearsLuz.toStringAsFixed(10);
      });
    }
  }

  void _reset() {
    setState(() {
      yearsLuzController.clear();
      uaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor Astronómico'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Convertir:'),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButton<String>(
                      value: selectedConversion,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedConversion = newValue!;
                          _reset();
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'lyToUA',
                          child: Text('Años luz a UA'),
                        ),
                        DropdownMenuItem(
                          value: 'uaToLY',
                          child: Text('UA a Años luz'),
                        ),
                      ],
                      underline:
                          Container(), // Elimina la línea inferior por defecto
                      borderRadius: BorderRadius.circular(12.0),
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 2,
                      style: TextStyle(color: Colors.grey[800], fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (selectedConversion == 'lyToUA')
              Column(
                children: [
                  TextField(
                    controller: yearsLuzController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Años luz',
                      border: OutlineInputBorder(),
                      suffixText: 'ly',
                    ),
                    onChanged: (value) => convert(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: uaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Unidades Astronómicas',
                      border: OutlineInputBorder(),
                      suffixText: 'UA',
                      enabled: false,
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  TextField(
                    controller: uaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Unidades Astronómicas',
                      border: OutlineInputBorder(),
                      suffixText: 'UA',
                    ),
                    onChanged: (value) => convert(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: yearsLuzController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Años luz',
                      border: OutlineInputBorder(),
                      suffixText: 'ly',
                      enabled: false,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('Limpiar'),
            ),
            const SizedBox(height: 20),
            const Text(
              '1 año luz ≈ 63,241.1 Unidades Astronómicas',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
