import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pragma/src/providers/cats_provider.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/widgets/widgets.dart';

class CatsScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats'),
      ),
      body: Consumer<CatsProvider>(
        builder: (context, catsProvider, _) {
          final List<CatsModel> catsData = catsProvider.catsData;

          return ListView.builder(
            itemCount: catsData.length,
            itemBuilder: (context, index) {
              final cat = catsData[index];
              return CatCard(cat: cat);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CatsProvider>().fetchCatsData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
