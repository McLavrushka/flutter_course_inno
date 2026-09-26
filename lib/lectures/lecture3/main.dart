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
        body: SafeArea(child: Center(child: practiceRowColumn())),
      ),
    );
  }

  Container practiceRowColumn() {
    return Container(
      width: 173,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Image.asset('assets/sprite.png', width: 50)),
          Text('Sprite'),
          Text('325 ml'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$1.50'),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF53B175),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(Icons.add_rounded, color: Colors.white, size: 25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container columnExample() {
    return Container(
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // textBaseline: TextBaseline.alphabetic,
        children: [
          Text('dsj'),
          Icon(Icons.add),
          ElevatedButton(onPressed: () {}, child: Text('tap')),
          Container(
            height: 200,
            color: Colors.red,
            child: Text('hi', style: TextStyle(fontSize: 45)),
          ),
          FlutterLogo(),
        ],
      ),
    );
  }

  Row rowExample() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      spacing: 10,
      children: [
        // Text(
        //   '999',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        // ),
        // Text('\$', style: TextStyle(fontSize: 20)),
        // Icon(Icons.delete),
        // ElevatedButton(onPressed: () {}, child: Text('Нажми на меня')),
        Container(width: 20, color: Colors.red, height: 100),
        Container(width: 20, color: Colors.yellow, height: 100),
        Container(width: 20, color: Colors.green, height: 100),
      ],
    );
  }
}
