import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/screens/home/detail_screen.dart';
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
                Text(cat.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                InkWell(
                  onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) => ScreenDetails(cat: cat),
                  ),
                   );
                  },
                  child: const Text(
                    'Mas...',
                  ),
                )
              ],
            ),
            CatImage(cat: cat, media: media),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Origen: ${cat.origin}'),
                Text('Inteligencia: ${cat.intelligence}')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CatImage extends StatelessWidget {
  const CatImage({
    super.key,
    required this.cat,
    required this.media,
  });

  final CatsModel cat;
  final Size media;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: CatsService().validateImageURL(cat.referenceImageId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Text('Error al cargar la imagen');
        }

        return Image.network(
          snapshot.data!,
          height: media.height * 0.3,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
