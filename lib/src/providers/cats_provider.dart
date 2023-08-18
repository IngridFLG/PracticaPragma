import 'package:flutter/material.dart';
import 'package:prueba_pragma/src/models/cats_model.dart';
import 'package:prueba_pragma/src/service/cats_service.dart';

class CatsProvider extends ChangeNotifier {
  final CatsService _catsService = CatsService();
  List<CatsModel> _catsData = [];
  List<CatsModel> _filteredCats = []; // Lista filtrada
  bool _isInitialized = false;

  List<CatsModel> get catsData => _filteredCats.isNotEmpty ? _filteredCats : _catsData;
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

  void filterCatsByName(String name) {
    _filteredCats = _catsData.where((cat) => cat.name.toLowerCase().contains(name.toLowerCase())).toList();
    notifyListeners();
  }

  List<CatsModel> getFilteredCats(String name) {
    return _catsData.where((cat) => cat.name.toLowerCase().contains(name.toLowerCase())).toList();
  }

  void updateFilteredCats(List<CatsModel> newFilteredCats) {
    _filteredCats = newFilteredCats;
    notifyListeners();
  }
}
