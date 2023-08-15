import 'package:flutter/material.dart';
import 'package:prueba_pragma/infrastructure/models/cats_model.dart';
import 'package:prueba_pragma/service/cats_service.dart';

class CatsScreen extends StatelessWidget {
  final CatsService apiService = CatsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CatsModel>>(
      future: apiService.fetchBreeds(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<CatsModel> breeds = snapshot.data!;
          return ListView.builder(
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(breeds[index].name),
                subtitle: Text(breeds[index].description),
              );
            },
          );
        }
      },
    );
  }
}