import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/home/home_screen.dart';
import 'package:app_tesisinver/screens/deleteaccount/delete_account.dart';

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
                // Aquí puedes agregar la lógica para navegar a la pantalla de registro de cultivo
              },
            ),
            ListTile(
              title: Text('Monitorear cultivo'),
              onTap: () {
                // Aquí puedes agregar la lógica para navegar a la pantalla de monitoreo de cultivo
              },
            ),
            ListTile(
              title: Text('Controlar cultivo'),
              onTap: () {
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
        child: Text('Contenido de la pantalla principal'),
      ),
    );
  }
}
