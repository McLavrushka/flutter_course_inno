// void main() {
//   print('String');
//   final x = 5 + 5;
//   print(x);

// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final elements = [
    'Первый виджет',
    'Второй виджет',
    'Третий виджет',
    'Четвертый виджет',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: elements.length,
          itemBuilder: (_, index) => Container(
            color: Colors.red,
            width: 50,
            child: Row(
              children: [
                Text(elements[index]),
                IconButton(
                  onPressed: () {
                    elements.removeAt(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
