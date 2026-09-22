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
      home: Scaffold(body: alignPaddingPractice()),
    );
  }

  Align alignPaddingPractice() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(right: 30, bottom: 50),
        child: Text('Я почти внизу!!'),
      ),
    );
  }

  Container containerPractice() {
    return Container(
      margin: EdgeInsets.all(50),
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.red,
        border: BoxBorder.all(color: Colors.black, width: 10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.lock, size: 30),
    );
  }
}
