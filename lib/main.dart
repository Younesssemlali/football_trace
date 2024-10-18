import 'package:flutter/material.dart';
import 'measure_input_page.dart';  // Importer la page créée

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Trace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MeasureInputPage(), // Afficher la page d'entrée des mesures
    );
  }
}
