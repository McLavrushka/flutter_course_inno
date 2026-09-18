import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          imageExample(),
          buttonExample(),
          iconExample(),
          textExample(),
        ],
      ),
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
