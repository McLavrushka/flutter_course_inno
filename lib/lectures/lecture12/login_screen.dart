import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  String? error;
  bool isLogin = false;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              if (!isLogin)
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Никнейм'),
                ),
              TextField(
                controller: loginController,
                decoration: InputDecoration(hintText: 'Почта'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Пароль'),
              ),
              if (error != null) Text(error!),
              if (isLogin)
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: loginController.text,
                        password: passwordController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        error = 'Ошибка: $e';
                      });
                    }
                  },
                  child: Text('Войти'),
                ),
              if (!isLogin)
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final cred = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: loginController.text,
                            password: passwordController.text,
                          );
                      cred.user?.updateDisplayName(nameController.text);
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        error = 'Ошибка: $e';
                      });
                    }
                  },
                  child: Text('Зарегистрироваться'),
                ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? 'Нет аккаунта? Зарегистрироваться'
                      : 'Уже есть аккаунт? Войти',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
