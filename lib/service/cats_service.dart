import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_pragma/infrastructure/models/cats_model.dart';

class CatsService {
  final String baseUrl = 'https://api.thecatapi.com/v1/breeds';
  final String apiKey = 'bda53789-d59e-46cd-9bc4-2936630fde39';

  Future<List<CatsModel>> fetchBreeds() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CatsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load breeds');
    }
  }
}