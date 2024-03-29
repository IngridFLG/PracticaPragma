import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_pragma/src/models/cats_model.dart';

class CatsService {
  final String urlApi = 'https://api.thecatapi.com/v1';
  final String apiKey = 'bda53789-d59e-46cd-9bc4-2936630fde39';

  Future<List<CatsModel>> fetchCatsData() async {
    final url = Uri.parse("$urlApi/breeds");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "x-api-key": apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final responseList = jsonData.map((obj) => CatsModel.fromJson(obj)).toList();
      return responseList;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<String?> validateImageURL(String? imageId) async {
  final urlJpg = Uri.parse('https://cdn2.thecatapi.com/images/$imageId.jpg');
  final urlPng = Uri.parse('https://cdn2.thecatapi.com/images/$imageId.png');

  try {
    final responseJpg = await http.head(urlJpg);
    if (responseJpg.statusCode == 200) {
      return urlJpg.toString();
    }

    final responsePng = await http.head(urlPng);
    if (responsePng.statusCode == 200) {
      return urlPng.toString();
    }
    
    // Ninguno de los enlaces de imágenes está disponible
    return null;
  } catch (error) {
    throw Exception('Error validating image URL: $error');
  }
}
}