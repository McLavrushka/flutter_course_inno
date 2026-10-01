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
          child: Container(
            height: 50,
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: [
                CircleAvatar(child: Text('A')),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Text('Имя Фамилия')),
                      Expanded(
                        child: Text(
                          'Привет покааааааааааааааааааааааааааааааааааа',
                        ),
                      ),
                    ],
                  ),
                ),
                Text('12:32'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container lecture() {
  return Container(
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.lightBlue,
            child: Text(
              'Заголовок',
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        Spacer(flex: 4),

        Expanded(
          flex: 1,
          child: Container(color: Colors.black, child: Icon(Icons.circle)),
        ),

        Expanded(
          flex: 1,
          child: Container(color: Colors.red, child: Icon(Icons.circle)),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 1,
          child: Container(color: Colors.grey, child: Icon(Icons.circle)),
        ),
        Expanded(
          flex: 1,
          child: Container(color: Colors.green, child: Icon(Icons.circle)),
        ),
      ],
    ),
  );
}

SafeArea ans2() {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(child: Text('A')),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text('Имя Фамилия'),

                Text(
                  'Привет!dbopdshohsdophusd0uhds[0h0[ds-sd]]vipyp0iyf80y08yf8f0yf808y0f',
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const Text('12:40'),
        ],
      ),
    ),
  );
}

Column ans1() {
  return Column(
    children: [
      Expanded(child: Container(height: 80, color: Colors.red)),
      Expanded(flex: 2, child: Container(color: Colors.yellow)),
      Expanded(child: Container(height: 60, color: Colors.green)),
    ],
  );
}

Flex flexEx() {
  return Flex(
    direction: Axis.horizontal,
    spacing: 16,
    children: [
      Container(width: 100, height: 100, color: Colors.red),
      Container(width: 100, height: 100, color: Colors.orange),

      Container(width: 100, height: 100, color: Colors.yellow),

      Container(width: 100, height: 100, color: Colors.green),

      Container(width: 100, height: 100, color: Colors.black),
    ],
  );
}
