import 'package:flutter/material.dart';
import 'package:football_trace/garment_piece.dart';
import 'display_mattress.dart';  // Importer la page d'affichage du matelas

class MeasureInputPage extends StatefulWidget {
  @override
  _MeasureInputPageState createState() => _MeasureInputPageState();
}

class _MeasureInputPageState extends State<MeasureInputPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  List<GarmentPiece> pieces = [];  // Liste pour stocker les pièces

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrer les mesures des pièces'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),è
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nom de la pièce (ex: Devant, Épaules)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: widthController,
              decoration: InputDecoration(
                labelText: 'Largeur (en cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: heightController,
              decoration: InputDecoration(
                labelText: 'Hauteur (en cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final double width = double.tryParse(widthController.text) ?? 0;
                final double height = double.tryParse(heightController.text) ?? 0;

                if (name.isNotEmpty && width > 0 && height > 0) {
                  setState(() {
                    pieces.add(GarmentPiece(name: name, width: width, height: height));
                  });
                }

                // Vider les champs après ajout
                nameController.clear();
                widthController.clear();
                heightController.clear();
              },
              child: Text('Ajouter la pièce'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: pieces.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${pieces[index].name}'),
                    subtitle: Text('Largeur: ${pieces[index].width} cm, Hauteur: ${pieces[index].height} cm'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Passer à la page d'affichage du matelas
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayMattress(pieces: pieces),
                  ),
                );
              },
              child: Text('Afficher sur le matelas'),
            ),
          ],
        ),
      ),
    );
  }
}
