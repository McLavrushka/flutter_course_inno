import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.topRight,
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border(top: BorderSide(color: Colors.blue, width: 20)),
          ),
          child: Container(color: Colors.blue, width: 20, height: 20),
        ),
      ),
    ),
  ),
);

Align alignExample() {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
      child: Text('Я почти внизу!'),
    ),
  );
}

Padding examplePadding() => Padding(
  padding: EdgeInsets.only(left: 10, top: 50),
  child: Text('Всем привет!!!!!!!!!!!', style: TextStyle(fontSize: 55)),
);

Image imagExample() {
  return Image.network(
    'https://tlum.ru/uploads/22fa9437434982ea805c89581a59f5487dff254c222261114e9668c829225a9f.jpeg',
    errorBuilder: (context, error, stackTrace) {
      debugPrint('Image error: $error'); // тут будет реальная причина
      return const Text('Фото не найдено');
    },
    fit: BoxFit.cover,
  );
}

Image errorImage() {
  return Image.network(
    'https://png.pngtree.com/png-clipart/20230511/ourmid/pngtree-isolated-cat-on-white-background-png-image_7094927.png',
    //https://tlum.ru/uploads/22fa9437434982ea805c89581a59f5487dff254c222261114e9668c829225a9f.jpeg'
    errorBuilder: (context, error, stackTrace) {
      debugPrint('Image error: $error');
      return const Icon(Icons.broken_image);
    },
  );
}
