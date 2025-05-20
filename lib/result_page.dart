import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int sonuc;

  const ResultPage({required this.sonuc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Estimated life expectancy: $sonuc years",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
