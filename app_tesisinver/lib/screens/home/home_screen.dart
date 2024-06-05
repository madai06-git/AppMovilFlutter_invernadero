import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/custom/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 150.0,
              ),
              SizedBox(height: 50),
              CustomButton(
                text: 'Crear una cuenta nueva',
                backgroundColor: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
              SizedBox(height: 20.0),
              CustomButton(
                text: 'Iniciar sesión',
                backgroundColor: Colors.white,
                textColor: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
