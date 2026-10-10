Future<void> makeCoffee() async {
  try {
    await Future.delayed(Duration(seconds: 4), () => 'Капучино');
    throw Exception('Всё сломалось');
  } catch (e) {
    print('Ошибка: $e');
  } finally {}
}

