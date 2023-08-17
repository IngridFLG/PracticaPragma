import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/service/cats_service.dart';

class CatCard extends StatelessWidget {
  final CatsModel cat;

  CatCard({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cat.name),
              TextButton(onPressed: () {}, child: Text('Mas...')),
            ],
          ),
          FutureBuilder<String?>(
            future: CatsService().validateImageURL(cat.referenceImageId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError || snapshot.data == null) {
                return Text('Error al cargar la imagen');
              }

              return Image.network(
                snapshot.data!, // Usa el valor solo si no es null
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              );
            },
          ),
        ],
      ),
    );
  }
}

