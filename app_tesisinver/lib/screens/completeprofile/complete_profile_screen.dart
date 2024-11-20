import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/automategreenhouses/automate_greenhouse.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AutomateGreenhouseScreen()),
                );
              },
              child: Text('Automatizar Invernaderos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AutomateGreenhouseScreen()),
                );
              },
              child: Text('Automatizar Huertos de Traspatio'),
            ),
          ],
        ),
      ),
    );
  }
}
