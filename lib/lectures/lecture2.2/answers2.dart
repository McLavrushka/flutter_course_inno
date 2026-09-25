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
          child: Center(
            child: Column(
              children: [
                Text(
                  'IconButton:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                iconButton(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'TextButton:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                textButton(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'InkWell:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                inkWell(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell inkWell() {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text("InkWell кнопка"),
      ),
      onTap: () {
        print('InkWell');
      },
    );
  }

  TextButton textButton() {
    return TextButton(
      onPressed: () {
        print('TextButton');
      },
      child: Text('Тектовая кнопка'),
    );
  }

  IconButton iconButton() {
    return IconButton(
      onPressed: () {
        print('IconButton');
      },
      icon: Icon(Icons.delete, color: Colors.red),
    );
  }
}
