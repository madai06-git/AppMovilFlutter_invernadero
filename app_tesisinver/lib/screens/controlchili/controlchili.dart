import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ControlChile extends StatefulWidget {
  @override
  _ControlChileState createState() => _ControlChileState();
}

class _ControlChileState extends State<ControlChile> {
  bool isCalefaccionOn = false;
  bool isVentilacionOn = false;

  final String serverUrl =
      'http://192.168.1.75:3000'; // Reemplaza con la URL de tu servidor

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
    sendCommand(isCalefaccionOn ? 'calefaccion_off' : 'calefaccion_on');
  }

  void toggleVentilacion() {
    setState(() {
      isVentilacionOn = !isVentilacionOn;
    });
    sendCommand(isVentilacionOn ? 'ventilacion_off' : 'ventilacion_on');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de Chiles'),
      ),
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            SizedBox(height: 20),
            Text(
              'Control de Chiles',
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
                backgroundColor: isCalefaccionOn ? Colors.red : Colors.green,
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
                backgroundColor: isVentilacionOn ? Colors.red : Colors.green,
              ),
            ),
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
