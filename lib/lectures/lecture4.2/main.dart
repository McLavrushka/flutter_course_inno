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
        appBar: AppBar(title: Text('Заголовок'),),
        body: SafeArea(
          child: Wrap(
            runSpacing: 10,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              Container(color: Colors.grey, width: 100, height: 200,),
              Container(color: Colors.grey[200], width: 300, height: 100,),
              Container(color: Colors.grey, width: 300, height: 200,),
              Container(color: Colors.black, width: 400, height: 100,),
            ],
          ),
        ),
      ),
    );
  }

  Stack stack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: Colors.red, width: 100),
        Positioned(bottom: 100, right: 5, child: Icon(Icons.star)),
        Icon(Icons.delete, color: Colors.green),
      ],
    );
  }

  Column builder() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, i) => Text("Привет"),
            itemCount: 100,
          ),
        ),
      ],
    );
  }

  Scrollbar scroll() {
    return Scrollbar(
      thickness: 10,
      child: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(color: Colors.grey, width: 100, child: TextField()),
              Container(color: Colors.grey[200], height: 300),
              Container(color: Colors.grey, height: 300),
              Container(color: Colors.black, height: 400),
            ],
          ),
        ),
      ),
    );
  }
}

RefreshIndicator builder() {
  return RefreshIndicator(
    onRefresh: () async => () {},
    child: Scrollbar(
      thickness: 0,
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (_, i) => Container(
          color: Colors.red,
          child: Text(i.toString()),
        ), // только для видимых
      ),
    ),
  );
}

Wrap wrapEx() {
  return Wrap(
    children: [
      ElevatedButton(onPressed: () {}, child: Text('Кнопка 1')),
      ElevatedButton(onPressed: () {}, child: Text('Кнопка 2')),

      ElevatedButton(onPressed: () {}, child: Text('Кнопка 3')),
      ElevatedButton(onPressed: () {}, child: Text('Кнопка 4')),
      ElevatedButton(onPressed: () {}, child: Text('Кнопка 5')),
      ElevatedButton(onPressed: () {}, child: Text('Кнопка 6')),
    ],
  );
}

Stack stackEx() {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Image.network(
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      ),
      Container(
        padding: EdgeInsets.all(10),
        color: Colors.black,
        child: Text('Подпись к фото', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}
