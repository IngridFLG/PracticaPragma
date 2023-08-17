import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pragma/src/providers/cats_provider.dart';
import 'package:prueba_pragma/src/screens/home/cats_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatsProvider())
      ],
      child: MaterialApp(
        title: 'Practica Pragma',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: CatsScreen2(),
      ),
    );
  }
}
