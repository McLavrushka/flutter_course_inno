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
        body: Center(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3,
            ),
            alignment: Alignment.bottomCenter,
            color: Color(0xFF121223),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF7622),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(maxHeight: 70),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
