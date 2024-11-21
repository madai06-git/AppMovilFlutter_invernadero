import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ControlInterfaceScreen extends StatefulWidget {
  const ControlInterfaceScreen({Key? key}) : super(key: key);

  @override
  _ControlInterfaceState createState() => _ControlInterfaceState();
}

final String serverUrl = 'http://192.168.1.77:3000';

class _ControlInterfaceState extends State<ControlInterfaceScreen> {
  List<String> selectedCrops = [];

  // Método para cargar los cultivos seleccionados desde el servidor
  Future<void> loadSelectedCrops() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id'); // ID del usuario guardado

    if (userId != null) {
      final url = Uri.parse('$serverUrl/obtener-cultivos/$userId');
      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data.containsKey('cultivos') && data['cultivos'] is List) {
            setState(() {
              selectedCrops = List<String>.from(data['cultivos']);
            });
          } else {
            print('La respuesta no contiene cultivos');
          }
        } else {
          print('Error al recuperar los cultivos: ${response.statusCode}');
        }
      } catch (e) {
        print('Error al hacer la solicitud HTTP: $e');
      }
    } else {
      print('ID de usuario no encontrado');
    }
  }

  @override
  void initState() {
    super.initState();
    loadSelectedCrops();
    toggleMode("modo_control");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de cultivos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CropButton(
                  crop: 'Tomate',
                  isSelected: selectedCrops.contains('Tomate'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/controltomato');
                  },
                ),
                CropButton(
                  crop: 'Chile',
                  isSelected: selectedCrops.contains('Chile'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/controlchili');
                  },
                ),
                CropButton(
                  crop: 'Berrie',
                  isSelected: selectedCrops.contains('Berrie'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/controlberries');
                  },
                ),
                CropButton(
                  crop: 'Pepino',
                  isSelected: selectedCrops.contains('Pepino'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/controlcucumber');
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/main_interface_screen');
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

class CropButton extends StatelessWidget {
  final String crop;
  final bool isSelected;
  final VoidCallback onTap;

  const CropButton({
    required this.crop,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? onTap : null,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.green : Colors.grey,
        ),
        child: Image.asset(
          'assets/$crop.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

Future<void> toggleMode(String mode) async {
  final Uri uri = Uri.parse('$serverUrl/setMode');
  final response = await http.post(uri,
      body: json.encode({"mode": mode}),
      headers: {"Content-Type": "application/json"});

  if (response.statusCode != 200) {
    print('Error al cambiar el modo: ${response.statusCode}');
  } else {
    print('Modo cambiado a: $mode');
    await Future.delayed(Duration(seconds: 1)); // Espera breve
  }
}
