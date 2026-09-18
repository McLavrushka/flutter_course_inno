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
      home: Scaffold(body: Center(child: Text('Hello. world!'))),
    );
  }

  Image imageNetworkExample() {
    return Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6v10CEz083kJuE-74uN1mw3k8-v4Tw0UA9JTEgsvUO5jUvRkbKFBshcM&s=10',
    );
  }

  Image imageAssetExample() {
    return Image.asset('assets/cat.jpeg');
  }
}

Icon icon() => Icon(Icons.check, size: 120, color: Colors.green);

Text practice1() {
  return Text(
    'Привет от Дианы',
    style: TextStyle(
      color: Color(0xFFFFFFFF),
      backgroundColor: Colors.red,
      fontSize: 52,
      fontWeight: FontWeight.w500,
      fontFamily: 'serif',
    ),
  );
}

Widget buttonExample() {
  return ElevatedButton(
    onPressed: () {
      print('Кнопка нажата');
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      elevation: 7,
      shadowColor: Colors.green,
    ),
    child: Icon(Icons.add),
  );
}
