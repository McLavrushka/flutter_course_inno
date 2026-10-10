import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loadedData = '';

  void loadData1() {
    final end = DateTime.now().add(const Duration(seconds: 2));
    while (DateTime.now().isBefore(end)) {}

    setState(() {
      loadedData = 'Data';
    });
  }

  void loadData2() {
    final result = Future.delayed(const Duration(seconds: 2), () => 'Data');
    setState(() => loadedData = result.toString());
  }

  void loadData3() async {
    setState(() => loadedData = 'Загрузка...');
    final result = await Future.delayed(
      const Duration(seconds: 2),
      () => 'Data',
    );
    setState(() => loadedData = result);
  }

  void loadNetwork() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/postss');
    final response = await http.get(url);
    setState(() => loadedData = response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('Ошибка');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              if (loadedData.isNotEmpty) Text(loadedData),

              CircularProgressIndicator(),
              ElevatedButton(
                onPressed: loadData1,
                child: Text('Загрузить данные 1'),
              ),
              ElevatedButton(
                onPressed: loadData2,
                child: Text('Загрузить данные 2'),
              ),
              ElevatedButton(
                onPressed: loadData3,
                child: Text('Загрузить данные 3'),
              ),
              ElevatedButton(
                onPressed: loadNetwork,
                child: Text('Загрузить из сети'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
