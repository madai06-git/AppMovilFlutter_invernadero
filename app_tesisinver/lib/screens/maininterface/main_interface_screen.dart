import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_tesisinver/screens/home/home_screen.dart';
import 'package:app_tesisinver/screens/deleteaccount/delete_account.dart';
import 'package:app_tesisinver/screens/automategreenhouses/automate_greenhouse.dart';
import 'package:app_tesisinver/screens/monitorcultivation/monitor_interface.dart';

class MainInterfaceScreen extends StatelessWidget {
  final int userId;
  final String serverUrl = 'http://192.168.1.77:3000';
  MainInterfaceScreen({required this.userId});

  Future<void> obtenerCultivos() async {
    final Uri uri = Uri.parse('$serverUrl/obtener-cultivos/$userId');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Procesar cultivos
    } else {
      // Manejar error
    }
  }

  /*Future<void> setMode(String mode) async {
    final Uri uri = Uri.parse('$serverUrl/setMode');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'mode': mode}),
    );

    if (response.statusCode == 200) {
      print('Modo cambiado a: $mode');
    } else {
      print('Error al cambiar el modo: ${response.body}');
    }
  }*/

  // Método para eliminar la cuenta
  Future<void> eliminarCuenta(BuildContext context) async {
    final Uri uri = Uri.parse('$serverUrl/eliminar-cuenta/$userId');

    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      // Si la cuenta se elimina con éxito, navega a la pantalla de inicio
      Navigator.pushReplacementNamed(context, '/home_screen');
    } else {
      // Manejar error
      print('Error al eliminar la cuenta');
    }
  }

  @override
  Widget build(BuildContext context) {
    obtenerCultivos(); // Llamar a obtenerCultivos cuando se carga la pantalla

    return Scaffold(
      appBar: AppBar(
        title: Text('¡¡BIENVENIDO!!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('assets/logo.png', height: 100),
                  ),
                  Text(
                    '¡¡BIENVENIDO!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Registrar cultivo'),
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/automate_greenhouse'); // Navegar a la pantalla de inicio
              },
            ),
            ListTile(
              title: Text('Monitorear cultivo'),
              onTap: () async {
                //await setMode('modo_monitoreo');
                Navigator.pushReplacementNamed(context,
                    '/monitor_interface'); // Navegar a la pantalla de monitorear cultivos
              },
            ),
            ListTile(
              title: Text('Controlar cultivo'),
              onTap: () async {
                //await setMode('modo_control');
                Navigator.pushReplacementNamed(context, '/control_interface');
                // Aquí puedes agregar la lógica para navegar a la pantalla de control de cultivo
              },
            ),
            ListTile(
              title: Text('Eliminar cultivo'),
              onTap: () {
                // Aquí puedes agregar la lógica para eliminar un cultivo
              },
            ),
            /*ListTile(
              title: Text('Editar información'),
              onTap: () {
                // Aquí puedes agregar la lógica para editar la información del usuario
              },
            ),*/
            ListTile(
              title: Text('Eliminar cuenta'),
              onTap: () {
                _showDeleteConfirmationDialog(context);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/home_screen'); // Navegar a la pantalla de inicio
              },
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            SizedBox(
                height: 20), // Espacio entre el logo y el texto de bienvenida
            Text(
              '¡BIENVENIDO A AGROMONITOR! Tu herramienta todo en uno para monitorear y controlar invernaderos y huertos traspatio. ¡comienza a cultivar tus sueños hoy mismo!',
              textAlign: TextAlign.center, // Centrar el texto
              style: TextStyle(fontSize: 16), // Tamaño de fuente
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar el cuadro de diálogo de confirmación
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Estás seguro de eliminar tu cuenta?'),
          content: Text('Esta acción no se puede deshacer.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                eliminarCuenta(
                    context); // Llamar al método para eliminar la cuenta
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
