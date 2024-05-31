import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> iniciarSesion(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu correo y contraseña')),
      );
      return;
    }

    final Uri uri = Uri.parse('http://192.168.1.64:3000/login');

    try {
      final response = await http.post(
        uri,
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Inicio de sesión exitoso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inicio de sesión exitoso')),
        );
        Navigator.pushReplacementNamed(context, '/main_interface_screen');
      } else {
        // Error en el inicio de sesión
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Correo electrónico o contraseña incorrectos')),
        );
      }
    } catch (e) {
      // Error de conexión
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Bienvenido a AgroMonitor',
                  style: TextStyle(fontSize: 24.0)),
              SizedBox(height: 20.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  iniciarSesion(context);
                },
                child: Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
