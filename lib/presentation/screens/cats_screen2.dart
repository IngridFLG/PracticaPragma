import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CatsScreen2 extends StatefulWidget {
  const CatsScreen2({super.key});

  @override
  State<CatsScreen2> createState() => _CatsScreen2State();
}


class _CatsScreen2State extends State<CatsScreen2> {

  dynamic cats;

  @override
  void initState() {
    super.initState();
    getCats();
  }

  Future<void> getCats() async{
    final url = Uri.parse('https://api.thecatapi.com/v1/breeds/abys');
    final headers = {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'};

    final response = await http.get(url, headers: headers);
    setState(() {
      cats = json.decode(response.body);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cats?['name'] ?? 'No data'),
          ],
        ),
      ),
    );
  }
}