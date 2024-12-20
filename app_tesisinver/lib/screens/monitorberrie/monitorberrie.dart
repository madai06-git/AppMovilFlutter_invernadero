import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MonitorBerriesScreen(),
    );
  }
}

class MonitorBerriesScreen extends StatefulWidget {
  @override
  _MonitorBerriesScreenState createState() => _MonitorBerriesScreenState();
}

class _MonitorBerriesScreenState extends State<MonitorBerriesScreen> {
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
        await http.get(Uri.parse('http://192.168.1.77:3000/api/data'));

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
        title: Text('Monitor de Berries'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo de la aplicación
            Image.asset('assets/logo.png'),
            SizedBox(height: 20),
            Text(
              'Monitor de Berries',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            // Mostrar los datos de temperatura y humedad
            Text('Temperatura: $temperature °C'),
            Text('Humedad: $humidity %'),

            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final userId = prefs.getInt('user_id') ??
                    0; // Obtén el userId almacenado en SharedPreferences

                Navigator.pushReplacementNamed(
                  context,
                  '/main_interface_screen',
                  arguments: userId, // Pasa el userId aquí
                );
              },
              child: Text('Atrás'),
            ),
          ],
        ),
      ),
    );
  }
}
