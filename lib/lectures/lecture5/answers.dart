import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: scaffoldExample());
  }

  AppBar appBarExample() {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      backgroundColor: Colors.lightBlue,
      title: Text('MY FIRST WIDGET'),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
    );
  }

  Container imageExample() {
    return Container(
      width: 500,
      height: 400,
      color: Colors.red,
      child: Image.network(
        'https://tlum.ru/uploads/22fa9437434982ea805c89581a59f5487dff254c222261114e9668c829225a9f.jpeg',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  ElevatedButton buttonExample() {
    return ElevatedButton(
      onPressed: () {
        // ignore: avoid_print
        print("Кнопка нажата");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue.shade100,
        alignment: Alignment.bottomCenter,
        shadowColor: Colors.lightBlue,
        elevation: 3,
        padding: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blueAccent, width: 5),
          borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
        ),
      ),
      child: Icon(Icons.add, color: Colors.blueAccent),
    );
  }

  Icon iconExample() {
    return Icon(
      Icons.done,
      fontWeight: FontWeight.bold,
      size: 52,
      semanticLabel: 'Test',
      color: Colors.lightGreen,
    );
  }

  Text textExample() {
    return Text(
      'Привет от <Ваше Имя>',
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        backgroundColor: Colors.red,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: 'monospace',
      ),
    );
  }
}

Widget scaffoldExample() {
  return Scaffold(
    drawer: Drawer(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    appBar: AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      backgroundColor: Colors.lightBlue,
      title: Text('MY FIRST WIDGET'),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(
          icon: Icon(Icons.browse_gallery),
          label: 'Gallery',
        ),
      ],
    ),
    body: Text("HI"),
  );
}

/*
 TextStyle(
            color: Color(0xFFFFFFFF),
            backgroundColor: Colors.blue,
            fontSize: 52,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontFamily: 'fantasy',
),
          */
