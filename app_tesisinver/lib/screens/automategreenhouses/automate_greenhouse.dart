import 'package:flutter/material.dart';

class AutomateGreenhouseScreen extends StatefulWidget {
  const AutomateGreenhouseScreen({Key? key}) : super(key: key);

  @override
  _AutomateGreenhouseScreenState createState() =>
      _AutomateGreenhouseScreenState();
}

class _AutomateGreenhouseScreenState extends State<AutomateGreenhouseScreen> {
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
