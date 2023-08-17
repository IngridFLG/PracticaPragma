import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';

class CatCard extends StatelessWidget {
  final CatsModel cat;

  const CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cat.name),
              TextButton(onPressed: () {}, child: const Text('Mas...'))
            ],
          ),
          Image.network(
            'https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg',
            width: double.infinity, // Ajusta el ancho de la imagen
            height: 200, // Ajusta la altura de la imagen
            fit: BoxFit.cover, // Ajusta la forma en que la imagen se ajusta al espacio
          ),
          Row()
        ],
      ),
    );
  }
}