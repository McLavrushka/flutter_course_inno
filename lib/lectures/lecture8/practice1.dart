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
  // ваш код
}
