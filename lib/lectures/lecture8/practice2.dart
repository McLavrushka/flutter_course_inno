import 'dart:convert';

const booksJson = '''
[
  {"title": "Мастер и Маргарита", "year": 1967},
  {"title": "Война и мир", "year": 1869},
  {"title": "Дюна", "year": 1965}
]
''';

class Book {
  final String title;
  final int year;

  Book({required this.title, required this.year});
//Раскоментируйте код ниже
//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       // TODO 1: заполните title и year из json
//     );
//   }
// }

// void main() {
//   final decoded = jsonDecode(booksJson) as List;
//   final books = decoded.map((item) => Book.fromJson(item)).toList();

  // TODO 2: напечатайте название и год каждой книги циклом
}
