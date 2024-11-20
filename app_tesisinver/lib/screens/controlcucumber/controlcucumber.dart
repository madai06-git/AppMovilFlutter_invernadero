import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlCucumber extends StatefulWidget {
  @override
  _ControlCucumberState createState() => _ControlCucumberState();
}

class _ControlCucumberState extends State<ControlCucumber> {
  bool isCalefaccionOn = false;
  bool isVentilacionOn = false;
  bool isRiegoOn = false;

  final String serverUrl =
      'http://193.168.1.69:3000'; // Reemplaza con la URL de tu servidor

  Future<void> sendCommand(String command) async {
    final url = Uri.parse('$serverUrl/setCommand');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'command': command}),
      );

      if (response.statusCode == 200) {
        print('Comando enviado correctamente: $command');
      } else {
        print('Error al enviar comando: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al enviar comando: $e');
    }
  }

  void toggleCalefaccion() {
    setState(() {
      isCalefaccionOn = !isCalefaccionOn;
    });
    sendCommand(isCalefaccionOn ? 'calefaccion_on' : 'calefaccion_off');
  }

  void toggleVentilacion() {
    setState(() {
      isVentilacionOn = !isVentilacionOn;
    });
    sendCommand(isVentilacionOn ? 'ventilacion_on' : 'ventilacion_off');
  }

  void toggleRiego() {
    setState(() {
      isRiegoOn = !isRiegoOn;
    });
    sendCommand(isRiegoOn ? 'riego_on' : 'riego_off');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de pepino'),
      ),
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            SizedBox(height: 20),
            Text(
              'Control de Pepino',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Calefacción',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: toggleCalefaccion,
              child: Text(isCalefaccionOn ? 'OFF' : 'ON'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isCalefaccionOn ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Ventilación',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: toggleVentilacion,
              child: Text(isVentilacionOn ? 'OFF' : 'ON'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isVentilacionOn ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Riego',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: toggleRiego,
              child: Text(isRiegoOn ? 'OFF' : 'ON'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isRiegoOn ? Colors.green : Colors.red,
              ),
            ),
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
