import 'package:filmes/view/home.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const Filmes());
}

class Filmes extends StatelessWidget {
  const Filmes({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filmes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}


