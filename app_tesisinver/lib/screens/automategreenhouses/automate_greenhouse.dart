import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AutomateGreenhouseScreen extends StatefulWidget {
  const AutomateGreenhouseScreen({Key? key}) : super(key: key);

  @override
  _AutomateGreenhouseScreenState createState() =>
      _AutomateGreenhouseScreenState();
}

class _AutomateGreenhouseScreenState extends State<AutomateGreenhouseScreen> {
  List<String> selectedCrops = [];

  Future<void> saveSelectedCrops() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id') ?? 0;

    if (userId != 0 && selectedCrops.isNotEmpty) {
      final url = Uri.parse('http://193.168.1.69:3000/save_crops');

      final Map<String, dynamic> data = {
        'user_id': userId,
        'crop_name':
            selectedCrops, // Se manda la lista de cultivos directamente
      };

      print('Datos a enviar: ${json.encode(data)}');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        print('Cultivos guardados con éxito');
      } else {
        print('Error al guardar cultivos: ${response.body}');
      }
    } else {
      print(
          'No se encontró el ID de usuario o la lista de cultivos está vacía');
    }
  }
/*
  Future<void> loadSelectedCrops() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id'); // ID del usuario guardado

    if (userId != null) {
      final url =
          Uri.parse('http://192.168.1.72:3000/obtener-cultivos/$userId');
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

  /* Future<void> loadSelectedCrops() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCrops = prefs.getStringList('selected_crops') ?? [];
    });
  }
*/
  /*void toggleCropSelection(String crop) {
    setState(() {
      if (selectedCrops.contains(crop)) {
        selectedCrops.remove(crop);
      } else {
        selectedCrops.add(crop);
      }
    });
  }*/
  @override
  void initState() {
    super.initState();
    loadSelectedCrops(); // Cargar los cultivos seleccionados al iniciar la pantalla
  }*/
  /*Future<void> saveSelectedCrops() async {
    final prefs = await SharedPreferences.getInstance();
 final userId = prefs.getInt('user_id') ?? 0;  // Aquí asumo que el user_id está guardado en SharedPreferences


   // await prefs.setStringList('selected_crops', selectedCrops);
  }*/

  void toggleCropSelection(String crop) {
    setState(() {
      if (selectedCrops.contains(crop)) {
        selectedCrops.remove(crop);
      } else {
        selectedCrops.add(crop);
      }
    });
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
                  onTap: () => toggleCropSelection('Tomate'),
                ),
                CropButton(
                  crop: 'Chile',
                  isSelected: selectedCrops.contains('Chile'),
                  onTap: () => toggleCropSelection('Chile'),
                ),
                CropButton(
                  crop: 'Berrie',
                  isSelected: selectedCrops.contains('Berrie'),
                  onTap: () => toggleCropSelection('Berrie'),
                ),
                CropButton(
                  crop: 'Pepino',
                  isSelected: selectedCrops.contains('Pepino'),
                  onTap: () => toggleCropSelection('Pepino'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedCrops.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(selectedCrops[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          selectedCrops.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final userId = prefs.getInt('user_id') ??
                    0; // Obtén el userId almacenado en SharedPreferences
                if (userId != 0 && selectedCrops.isNotEmpty) {
                  await saveSelectedCrops(); // Guardamos los cultivos antes de continuar
                }
                Navigator.pushReplacementNamed(
                  context,
                  '/main_interface_screen',
                  arguments: userId, // Pasa el userId aquí
                );
              },
              child: Text('Continuar'),
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
      onTap: onTap,
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
