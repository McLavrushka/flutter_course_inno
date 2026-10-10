import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(body: Center(child: MyWidget())),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;
  String? error;
  String? data;

  Future<void> load() async {
    setState(() {
      isLoading = true;
      error = null;
    }); // 1
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/postss'),
      ); // 2
      if (response.statusCode != 200) {
        // 3
        throw Exception('Статус ${response.statusCode}');
      }
      setState(() => data = response.body); // 4
    } 
    catch (e) {
      setState(() => error = e.toString()); // 5
    } finally {
      setState(() => isLoading = false); // 6
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (error != null) {
      return Text('Ошибка: $error');
    }
    if (data != null) {
      return Text(data!);
    }
    return ElevatedButton(onPressed: load, child: Text('Нажмите «Загрузить»'));
  }
}
