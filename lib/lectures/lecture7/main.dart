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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              CircularProgressIndicator(),
              if (loadedData.isNotEmpty) Text(loadedData),
              ElevatedButton(
                onPressed: () async {
                  // final end = DateTime.now().add(const Duration(seconds: 10));
                  // while (DateTime.now().isBefore(end)) {}

                  // setState(() {
                  //   loadedData = 'Data';
                  // });
                  // print('start');
                  //  await makeCoffee();
                  // setState(() {});
                  final url = Uri.parse(
                    'https://jsonplaceholder.typicode.com/postsss/12',
                  );
                   http.Response response;
                  try {
                   response = await http.get(url);
                      if (response.statusCode == 404){
                      throw Exception('404');

                      }
                  } catch (e) {
                    print('Ошибка: $e');
                  } finally {}

                },
                child: Text('Загрузить данные'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
