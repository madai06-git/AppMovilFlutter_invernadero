import 'package:app_tesisinver/screens/login/login_screen.dart';
import 'package:app_tesisinver/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla de Inicio',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home_screen': (context) => HomeScreen(),
      },
    );
  }
}
