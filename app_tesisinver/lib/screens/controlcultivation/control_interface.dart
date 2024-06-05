import 'package:flutter/material.dart';
import 'package:app_tesisinver/screens/monitortomato/monitortomato.dart';
import 'package:app_tesisinver/screens/controltomato/controltomato.dart';

class ControlInterfaceScreen extends StatefulWidget {
  const ControlInterfaceScreen({Key? key}) : super(key: key);

  @override
  _ControlInterfaceState createState() => _ControlInterfaceState();
}

class _ControlInterfaceState extends State<ControlInterfaceScreen> {
  List<String> selectedCrops = [];

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
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/controltomato');
                  },
                ),
                CropButton(
                    crop: 'Chile',
                    isSelected: selectedCrops.contains('Chile'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/monitorchile');
                    }),
                CropButton(
                    crop: 'Berrie',
                    isSelected: selectedCrops.contains('Berrie'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/monitorberrie');
                    }),
                CropButton(
                    crop: 'Pepino',
                    isSelected: selectedCrops.contains('Pepino'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/monitorpepino');
                    }),
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
