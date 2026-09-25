import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox.expand(
            child: Container(
              //   width: double.infinity,
              //   height: double.infinity,
              // constraints: BoxConstraints(
              //   minHeight: 200,
              //   minWidth: 200,
              //   maxHeight: 300,
              //   maxWidth: 300,
              // ),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.black, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),

              child: Container(
                height: double.infinity,
                color: Colors.green,
                child: Icon(Icons.lock, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
