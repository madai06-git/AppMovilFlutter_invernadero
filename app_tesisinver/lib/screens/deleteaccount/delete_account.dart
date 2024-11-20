import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_tesisinver/screens/login/login_screen.dart';

class DeleteAccountScreen extends StatelessWidget {
  final String userId;

  DeleteAccountScreen({required this.userId});

  Future<void> deleteAccount(BuildContext context) async {
    final Uri uri = Uri.parse('http://193.168.1.69:3000/delete_account');

    try {
      final response = await http.post(
        uri,
        body: json.encode({'id': userId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Cuenta eliminada exitosamente
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cuenta eliminada exitosamente')),
        );
        // Navegar a la pantalla de inicio de sesión o cualquier otra pantalla
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        // Error al eliminar la cuenta
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al eliminar la cuenta')),
        );
      }
    } catch (e) {
      // Error de conexión
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar tu cuenta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Eliminar'),
              onPressed: () {
                Navigator.of(context).pop();
                deleteAccount(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar cuenta'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showConfirmationDialog(context),
          child: Text('Eliminar cuenta'),
        ),
      ),
    );
  }
}
