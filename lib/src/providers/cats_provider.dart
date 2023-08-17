import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/service/cats_service.dart';

class CatsProvider extends ChangeNotifier {
  final CatsService _catsService = CatsService();
  List<CatsModel> _catsData = [];
  bool _isInitialized = false;

  List<CatsModel> get catsData => _catsData;
  bool get isInitialized => _isInitialized;

  Future<void> fetchCatsData() async {
    try {
      _catsData = await _catsService.fetchCatsData();
      _isInitialized = true;
      notifyListeners();
    } catch (error) {
      throw Exception("Error fetching cat data: $error");
    }
  }
}

