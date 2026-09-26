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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              children: [
                Text(
                  'I',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: Colors.red),
                ),
                Icon(Icons.favorite, color: Colors.red, size: 50),
                Text(
                  'Flutter',
                  style: TextStyle(fontSize: 32, color: Colors.blue),
                ),
                FlutterLogo(size: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
