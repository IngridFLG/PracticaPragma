import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/service/cats_service.dart';

class CatsProvider extends ChangeNotifier {
  final CatsService _catsService = CatsService();
  List<CatsModel> _catsData = [];

  List<CatsModel> get catsData => _catsData;

  Future<void> fetchCatsData() async {
    try {
      final List<CatsModel> data = await _catsService.fetchCatsData();
      _catsData = data;
      notifyListeners();
    } catch (error) {
      throw Exception("Error fetching cat data: $error");
    }
  }
}