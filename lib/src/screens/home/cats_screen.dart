import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pragma/src/providers/cats_provider.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/widgets/widgets.dart';

class CatsScreen extends StatelessWidget {
  static const String name = 'ScreenHome';

  const CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final catsProvider = Provider.of<CatsProvider>(context, listen: false);

    if (!catsProvider.isInitialized) {
      catsProvider.fetchCatsData();
    }

    final List<CatsModel> catsData = catsProvider.catsData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
      ),
      body: catsProvider.isInitialized
          ? ListView.builder(
              itemCount: catsData.length,
              itemBuilder: (context, index) {
                final cat = catsData[index];
                return CatCard(cat: cat);
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}


