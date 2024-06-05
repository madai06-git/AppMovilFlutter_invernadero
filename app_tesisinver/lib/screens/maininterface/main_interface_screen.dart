import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/home/home_screen.dart';
import 'package:app_tesisinver/screens/deleteaccount/delete_account.dart';
import 'package:app_tesisinver/screens/automategreenhouses/automate_greenhouse.dart';
import 'package:app_tesisinver/screens/monitorcultivation/monitor_interface.dart';

class MainInterfaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/monitor_interface'); // Navegar a la pantalla de monitorear cultivos
              },
            ),
            ListTile(
              title: Text('Controlar cultivo'),
              onTap: () {
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
            ListTile(
              title: Text('Editar información'),
              onTap: () {
                // Aquí puedes agregar la lógica para editar la información del usuario
              },
            ),
            ListTile(
              title: Text('Eliminar cuenta'),
              onTap: () {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/home_screen'); // Navegar a la pantalla de inicio
              },
              child: Text('Atrás'),
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
}
