// Практика: лампочка на Bloc
// Нажатие на кнопку включает и выключает лампочку.
// Нужен пакет: flutter pub add flutter_bloc
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO 1. Событие
// Базовый sealed-класс LightEvent и событие LightToggled («лампочку переключили»)

// TODO 2. Bloc
// LightBloc extends Bloc<LightEvent, bool>
// Начальное состояние — false (выключена)
// На LightToggled — emit противоположного состояния (подсказка: !state)

void main() => runApp(const LightApp());

class LightApp extends StatelessWidget {
  const LightApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 3. Оберните экран в BlocProvider, который создаёт LightBloc
    return const MaterialApp(home: LightScreen());
  }
}

class LightScreen extends StatelessWidget {
  const LightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 4. Оберните Column в BlocBuilder<LightBloc, bool>
    // и используйте состояние вместо isOn
    const isOn = false;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              size: 100,
              color: isOn ? Colors.amber : Colors.grey,
            ),
            ElevatedButton(
              onPressed: () {
                // TODO 5. Отправьте событие LightToggled в LightBloc
              },
              child: const Text('Переключить'),
            ),
          ],
        ),
      ),
    );
  }
}
