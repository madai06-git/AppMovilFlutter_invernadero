import 'package:app_tesisinver/screens/login/login_screen.dart';
import 'package:app_tesisinver/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/home/home_screen.dart';
import 'package:app_tesisinver/screens/completeprofile/complete_profile_screen.dart';
//import 'package:app_tesisinver/screens/deleteaccount/delete_account.dart';
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';
import 'package:app_tesisinver/screens/automategreenhouses/automate_greenhouse.dart';

void main() {
  runApp(MyApp());
}

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
        '/complete_profile_screen': (context) => CompleteProfileScreen(),
        '/main_interface_screen': (context) => MainInterfaceScreen(),
        '/automate_greenhouse': (context) => AutomateGreenhouseScreen(),
      },
    );
  }
}
