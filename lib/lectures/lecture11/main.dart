// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_course_inno/firebase_options.dart';
// import 'package:flutter_course_inno/lectures/lecture11/login_screen.dart';
// import 'package:flutter_course_inno/lectures/lecture11/main_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   User? _user;
//   late final StreamSubscription<User?> sub;
//   @override
//   void initState() {
//     super.initState();
//     sub = FirebaseAuth.instance.authStateChanges().listen((value) {
//       setState(() {
//         _user = value;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     sub.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: _user == null ? LoginScreen() : MainScreen(),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_inno/firebase_options.dart';
import 'package:flutter_course_inno/lectures/lecture11/login_screen.dart';
import 'package:flutter_course_inno/lectures/lecture11/old_main_screen.dart';

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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.data == null) {
            return LoginScreen();
          }
          return MainScreen();
        },
      ),
    );
  }
}
