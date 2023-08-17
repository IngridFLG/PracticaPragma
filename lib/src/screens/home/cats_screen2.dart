import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pragma/src/providers/cats_provider.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/widgets/widgets.dart';

class CatsScreen2 extends StatelessWidget {
  bool _isInitialized = false; // Variable para rastrear si los datos se han cargado

  @override
  Widget build(BuildContext context) {
    final catsProvider = context.watch<CatsProvider>();

    // Cargar los datos solo si no se han cargado previamente
    if (!_isInitialized) {
      catsProvider.fetchCatsData();
      _isInitialized = true;
    }

    final List<CatsModel> catsData = catsProvider.catsData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cats'),
      ),
      body: Consumer<CatsProvider>(
        builder: (context, catsProvider, _) {
          return ListView.builder(
            itemCount: catsData.length,
            itemBuilder: (context, index) {
              final cat = catsData[index];
              return CatCard(cat: cat);
            },
          );
        },
      ),
    );
  }
}