import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Container(height: 80, color: Colors.red)),
            Expanded(flex: 2, child: Container(color: Colors.yellow)),
            Expanded(child: Container(height: 60, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
