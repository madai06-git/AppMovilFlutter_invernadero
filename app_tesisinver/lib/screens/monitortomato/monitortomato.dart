import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MonitorTomatoScreen(),
    );
  }
}

class MonitorTomatoScreen extends StatefulWidget {
  @override
  _MonitorTomatoScreenState createState() => _MonitorTomatoScreenState();
}

class _MonitorTomatoScreenState extends State<MonitorTomatoScreen> {
  double temperature = 0.0;
  double humidity = 0.0;

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener datos cuando se inicia el widget
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.75:3000/api/data'));

    print('Estado de la respuesta: ${response.statusCode}');
    print('Respuesta: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = (data['temperature'] as num).toDouble();
        humidity = (data['humidity'] as num).toDouble();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitor de Tomates'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo de la aplicación
            Image.asset('assets/logo.png'),
            SizedBox(height: 20),
            Text(
              'Monitor de Tomates',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            // Mostrar los datos de temperatura y humedad
            Text('Temperatura: $temperature °C'),
            Text('Humedad: $humidity %'),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context,
                    '/main_interface_screen'); // Navegar a la pantalla de inicio
              },
              child: Text('Atrás'),
            ),
          ],
        ),
      ),
    );
  }
}
