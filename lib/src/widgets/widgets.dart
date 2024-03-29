import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/screens/details/detail_screen.dart';
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
  const CatImage({super.key, 
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
          return SpinPerfect(
            duration: const Duration(milliseconds: 1400), 
            animate: true,
            child: Image.asset(
              'assets/images/vueltasCat.png', 
              height: media.height * 0.2,
              fit: BoxFit.cover,
            ),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return Image.asset(
            'assets/images/gatoError.png', // Asegúrate de que la ruta sea correcta
            height: media.height * 0.3,
            fit: BoxFit.cover,
          );
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
