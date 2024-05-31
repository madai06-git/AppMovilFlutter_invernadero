import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completa tu Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset('assets/logo.png', height: 100),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí navegas a la pantalla de automatizar invernaderos
                Navigator.pushNamed(context, '/automate_greenhouses');
              },
              child: Text('Automatizar Invernaderos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí navegas a la pantalla de automatizar huertos de traspatio
                Navigator.pushNamed(context, '/automate_backyard_gardens');
              },
              child: Text('Automatizar Huertos de Traspatio'),
            ),
          ],
        ),
      ),
    );
  }
}
