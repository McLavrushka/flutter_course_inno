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
          child: Row(
            children: [
              const CircleAvatar(child: Text('A')),
              const SizedBox(width: 12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Имя Фамилия'),
                  Flexible(child: Text('Привет!')),
                ],
              ),
              Spacer(),
              const Text('12:40'),
            ],
          ),
        ),
      ),
    );
  }
}
