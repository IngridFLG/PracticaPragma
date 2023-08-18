import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    imageSvgText(
                      text: 'Origen: ${cat.origin}', 
                      imageSvg: 'assets/images/emoji-flags.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Inteligencia: ${cat.intelligence}', 
                      imageSvg: 'assets/images/brain-bold.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Adaptabilidad: ${cat.adaptability}', 
                      imageSvg: 'assets/images/puzzle.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Nivel de afeccion: ${cat.affectionLevel}', 
                      imageSvg: 'assets/images/heart.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Niño amigable: ${cat.childFriendly}', 
                      imageSvg: 'assets/images/child.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Nivel de energia: ${cat.energyLevel}', 
                      imageSvg: 'assets/images/energy.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Aseo: ${cat.grooming}', 
                      imageSvg: 'assets/images/clean-hands.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Esperanza de vida: ${cat.lifeSpan}', 
                      imageSvg: 'assets/images/life-in-the-balance.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'Problemas de salud: ${cat.healthIssues}', 
                      imageSvg: 'assets/images/baseline-sick.svg',
                      ),
                    espacio,
                    imageSvgText(
                      text: 'raro: ${cat.rare}', 
                      imageSvg: 'assets/images/fungus.svg',
                      ),
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

class imageSvgText extends StatelessWidget {

  final String text;
  final String imageSvg;

  const imageSvgText({super.key, required this.text, required this.imageSvg});

  @override
  Widget build(BuildContext context) {
    const commonStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold
    );
    return Row(
      children: [
        SvgPicture.asset(
          imageSvg,
          width: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: commonStyle
        ),
      ],
    );
  }
}