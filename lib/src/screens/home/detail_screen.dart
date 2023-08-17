import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/widgets/widgets.dart';

class ScreenDetails extends StatelessWidget {
  final CatsModel cat;

  const ScreenDetails({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final espacio = SizedBox(height: media.width * 0.05);

    const commonStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: CatImage(cat: cat, media: media),
          ),
          const SizedBox(height: 20),
          // Hacer que el texto esté alineado a la izquierda
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cat.description, style: commonStyle,),
                    espacio,
                    Text('Origen: ${cat.origin}', style: commonStyle,),
                    espacio,
                    Text('Inteligencia: ${cat.intelligence}', style: commonStyle,),
                    espacio,
                    Text('Adaptabilidad: ${cat.adaptability}', style: commonStyle,),
                    espacio,
                    Text('Nivel de afeccion: ${cat.affectionLevel}', style: commonStyle,),
                    espacio,
                    Text('Niño amigable: ${cat.childFriendly}', style: commonStyle,),
                    espacio,
                    Text('Nivel de energia: ${cat.energyLevel}', style: commonStyle,),
                    espacio,
                    Text('Aseo: ${cat.grooming}', style: commonStyle,),
                    espacio,
                    Text('Esperanza de vida: ${cat.lifeSpan}', style: commonStyle,),
                    espacio,
                    Text('Problemas de salud: ${cat.healthIssues}', style: commonStyle,),
                    espacio,
                    Text('raro: ${cat.rare}', style: commonStyle,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}