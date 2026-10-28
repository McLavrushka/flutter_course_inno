// Практика: лампочка на Bloc. Запуск: flutter run -t lib/lectures/lecture12/practice/light_main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Событие
sealed class LightEvent {}

class LightToggled extends LightEvent {}

// Bloc: состояние — просто bool (включена или нет)
class LightBloc extends Bloc<LightEvent, bool> {
  LightBloc() : super(false) {
    on<LightToggled>((event, emit) => emit(!state));
  }
}

void main() => runApp(const LightApp());

class LightApp extends StatelessWidget {
  const LightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (_) => LightBloc(),
            child: BlocBuilder<LightBloc, bool>(
              builder: (context, isOn) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lightbulb,
                    size: 100,
                    color: isOn ? Colors.amber : Colors.grey,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<LightBloc>().add(LightToggled()),
                    child: const Text('Переключить'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
