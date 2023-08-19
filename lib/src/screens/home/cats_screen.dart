import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pragma/src/providers/cats_provider.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/screens/details/detail_screen.dart';
import 'package:prueba_pragma/src/widgets/widgets.dart';

class CatsScreen extends StatelessWidget {
  static const String name = 'ScreenHome';

  const CatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catsProvider = Provider.of<CatsProvider>(context);

    // Verificar si los datos ya se han cargado
    if (!catsProvider.isInitialized) {
      // Asegurarse de que fetchCatsData se llame solo una vez al inicio
      Future.microtask(() => catsProvider.fetchCatsData());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 50.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              onChanged: (value) {
                final List<CatsModel> filteredCats = catsProvider.getFilteredCats(value);
                catsProvider.updateFilteredCats(filteredCats);
              },
              decoration: const InputDecoration(
                hintText: 'Search cats...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          catsProvider.isInitialized
              ? Expanded(
                  child: Consumer<CatsProvider>(
                    builder: (context, provider, child) {
                      final List<CatsModel> filteredCats = provider.catsData;
                      return ListView.builder(
                        itemCount: filteredCats.length,
                        itemBuilder: (context, index) {
                          final cat = filteredCats[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 500),
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: ScreenDetails(cat: cat),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'cat_image_${cat.id}', 
                              child: CatCard(cat: cat),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
