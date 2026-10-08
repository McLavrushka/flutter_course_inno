import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());

  print('test');
  // return null;
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Я ТУТ",
      color: Colors.red,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 179, 185, 188),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
        // scaffoldBackgroundColor: Colors.grey,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 52,
          ),
        ),
      ),
      home: MyWidget2(),
    );
  }
}

class MyWidget2 extends StatefulWidget {
  const MyWidget2({super.key});

  @override
  State<MyWidget2> createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Кнопка 1',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text('Кнопка 2')),
            ],
          ),
        ),
      ),
    );
  }
}
