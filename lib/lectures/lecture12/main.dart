import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_inno/firebase_options.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_cubit.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_event.dart';
import 'package:flutter_course_inno/lectures/lecture12/login_screen.dart';
import 'package:flutter_course_inno/lectures/lecture12/old_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.data == null) {
            return LoginScreen();
          }
          return BlocProvider(
            create: (_) => PostsCubit()..load(),
            child: MainScreen(),
          );
        },
      ),
    );
  }
}
