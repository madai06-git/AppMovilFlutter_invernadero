import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';

class ControlTomato extends StatefulWidget {
  @override
  _ControlTomatoState createState() => _ControlTomatoState();
}

class _ControlTomatoState extends State<ControlTomato> {
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

  /* @override
  void initState() {
    super.initState();
    toggleMode(
        "modo_control"); // Cambia al modo de control cuando entras en ControlTomato
  }

  Future<void> toggleMode(String mode) async {
    final Uri uri = Uri.parse('http://192.168.1.72:3000/setMode');
    final response = await http.post(uri,
        body: json.encode({"mode": mode}),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      print('Error al cambiar el modo: ${response.statusCode}');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de Tomate'),
      ),
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            SizedBox(height: 20),
            Text(
              'Control de Tomates',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Calefacción',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: toggleCalefaccion,
              child: Text(isCalefaccionOn ? 'ON' : 'OFF'),
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
              child: Text(isVentilacionOn ? 'ON' : 'OFF'),
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
              child: Text(isRiegoOn ? 'ON' : 'OFF'),
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
                  '/main_interface_screen', // Ruta hacia la pantalla de interfaz principal
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
