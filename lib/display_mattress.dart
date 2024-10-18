import 'package:flutter/material.dart';
import 'package:football_trace/garment_piece.dart';

class DisplayMattress extends StatelessWidget {
  final List<GarmentPiece> pieces;
  final double mattressWidth = 300; // Largeur du matelas en pixels (à ajuster)
  final double mattressHeight = 500; // Hauteur du matelas en pixels (à ajuster)

  DisplayMattress({required this.pieces});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matelas avec les pièces'),
      ),
      body: Center(
        child: Container(
          width: mattressWidth,
          height: mattressHeight,
          color: Colors.grey[300], // Représente le matelas
          child: Stack(
            children: pieces.map((piece) {
              return Positioned(
                left: (mattressWidth * 0.1), // Position X à ajuster
                top: (mattressHeight * 0.1), // Position Y à ajuster
                child: Container(
                  width: (piece.width / 100) * mattressWidth, // Ajuste l'échelle
                  height: (piece.height / 100) * mattressHeight, // Ajuste l'échelle
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.blue.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Text(piece.name),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
