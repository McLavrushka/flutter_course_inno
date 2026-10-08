import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

// class MyApp extends StatelessWidget {
//   int counter;
//  MyApp({super.key, required this.counter});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(body: Center(child: Text('Hello. world!'))),
//     );
//   }
// }

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    setState(() {});

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('njdjdn'),
              IconButton(
                onPressed: () {
                  if (counter > 0) {
                    setState(() {
                      counter--;
                    });
                  }
                },
                icon: Icon(Icons.remove),
              ),
              InkWell(
                onDoubleTap: () {
                  counter = 0;
                  print(counter.toString());
                  setState(() {});
                },
                child: Text(counter.toString()),
              ),
              IconButton(
                onPressed: () {
                  print(counter);
                  setState(() {
                    counter++;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
