import 'package:flutter/material.dart';
import 'package:prueba_pragma/infrastructure/models/cats_model.dart';
import 'package:prueba_pragma/presentation/screens/cats_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica Pragma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CatsScreen(),
    );
  }
}
