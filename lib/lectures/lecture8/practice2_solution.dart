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

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      year: json['year'],
    );
  }
}

void main() {
  final decoded = jsonDecode(booksJson) as List;
  final books = decoded.map((item) => Book.fromJson(item)).toList();

  for (final book in books) {
    print('${book.title} — ${book.year}');
  }
}
