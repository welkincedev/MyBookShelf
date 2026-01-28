import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';
import 'signup_screen.dart';
import 'bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  final List<Book> allBooks;

  const LoginScreen({super.key, required this.allBooks});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String error = '';

  void login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList('users') ?? [];

    bool found = false;
    for (var userStr in users) {
      Map<String, dynamic> user = jsonDecode(userStr);
      if (user['email'] == emailController.text &&
          user['password'] == passwordController.text) {
        found = true;
        await prefs.setString('loggedInUser', user['email']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => BottomNavScreen(allBooks: widget.allBooks),
          ),
        );
        break;
      }
    }

    if (!found) {
      setState(() {
        error = 'Invalid email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignupScreen(allBooks: widget.allBooks),
                  ),
                );
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
            const SizedBox(height: 10),
            Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
