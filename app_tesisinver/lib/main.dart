import 'package:app_tesisinver/screens/controlberries/controlberries.dart';
import 'package:app_tesisinver/screens/controlchili/controlchili.dart';
import 'package:app_tesisinver/screens/controlcucumber/controlcucumber.dart';
import 'package:app_tesisinver/screens/controlcultivation/control_interface.dart';
import 'package:app_tesisinver/screens/controltomato/controltomato.dart';
import 'package:app_tesisinver/screens/login/login_screen.dart';
import 'package:app_tesisinver/screens/monitorberrie/monitorberrie.dart';
import 'package:app_tesisinver/screens/monitorcucumber/monitorcucumber.dart';
import 'package:app_tesisinver/screens/monitorcultivation/monitor_interface.dart';
import 'package:app_tesisinver/screens/monitortomato/monitortomato.dart';
import 'package:app_tesisinver/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/home/home_screen.dart';
import 'package:app_tesisinver/screens/completeprofile/complete_profile_screen.dart';
//import 'package:app_tesisinver/screens/deleteaccount/delete_account.dart';
import 'package:app_tesisinver/screens/maininterface/main_interface_screen.dart';
import 'package:app_tesisinver/screens/automategreenhouses/automate_greenhouse.dart';
import 'package:app_tesisinver/screens/monitorchili/monitorchile.dart';

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
        '/monitor_interface': (context) => MonitorInterfaceScreen(),
        '/monitortomato': (context) => MonitorTomatoScreen(),
        '/monitorchile': (context) => MonitorChileScreen(),
        '/monitorberrie': (context) => MonitorBerriesScreen(),
        '/monitorpepino': (context) => MonitorCucumberScreen(),
        '/controltomato': (context) => ControlTomato(),
        '/control_interface': (context) => ControlInterfaceScreen(),
        '/controlchili': (context) => ControlChile(),
        '/controlberries': (context) => ControlBerries(),
        '/controlcucumber': (context) => ControlCucumber(),
      },
    );
  }
}
