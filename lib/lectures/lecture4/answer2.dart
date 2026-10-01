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
        ),
      ),
    );
  }
}
