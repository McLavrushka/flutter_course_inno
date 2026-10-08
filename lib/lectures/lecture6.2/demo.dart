import 'package:flutter/material.dart';

// void main() {
//   // runApp(MyApp());

//   int? number = null;

//   int result = number! + 5;
//   print(result);
//   print(something);

//   something();
// }

void main() {
  print(isAdult(15));
}

bool isAdult(int age) => age >= 18;

int something({String name = 'default'}) {
  return 5;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Hello. world!'))),
    );
  }
}
