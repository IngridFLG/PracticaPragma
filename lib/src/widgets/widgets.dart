import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/service/cats_service.dart';

class CatCard extends StatelessWidget {
  final CatsModel cat;

  const CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cat.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                TextButton(onPressed: () {}, child: const Text('Mas...')),
              ],
            ),
            FutureBuilder<String?>(
              future: CatsService().validateImageURL(cat.referenceImageId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
      
                if (snapshot.hasError || snapshot.data == null) {
                  return const Text('Error al cargar la imagen');
                }
      
                return Image.network(
                  snapshot.data!, // Usa el valor solo si no es null
                  height: media.height * 0.3,
                  fit: BoxFit.cover,
                );
              },
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('País: ${cat.origin}'),
                Text('Inteligencia: ${cat.intelligence}')
              ],
            )
          ],
        ),
      ),
    );
  }
}

