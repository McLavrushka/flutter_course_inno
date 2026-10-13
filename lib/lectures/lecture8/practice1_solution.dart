import 'dart:convert';

const bookJson = '''
{
  "title": "Мастер и Маргарита",
  "year": 1967,
  "author": {"name": "Булгаков", "country": "СССР"},
  "tags": ["роман", "классика", "мистика"]
}
''';

void main() {
  final book = jsonDecode(bookJson);
  print(book['title']);

  print(book['year']); // 1. 1967
  print(book['author']['name']); // 2. Булгаков
  print(book['tags'][1]); // 3. классика
  print(book['tags'].length); // 4. 3
  print(book['yaer']); // ★ null — никакой ошибки
}
