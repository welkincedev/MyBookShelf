import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';
import 'bottom_nav_screen.dart';

class SignupScreen extends StatefulWidget {
  final List<Book> allBooks;

  const SignupScreen({super.key, required this.allBooks});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String error = '';

  void signup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList('users') ?? [];

    bool exists = users.any((userStr) {
      Map<String, dynamic> user = jsonDecode(userStr);
      return user['email'] == emailController.text;
    });

    if (exists) {
      setState(() {
        error = 'Email already exists';
      });
      return;
    }

    Map<String, String> newUser = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    users.add(jsonEncode(newUser));
    await prefs.setStringList('users', users);
    await prefs.setString('loggedInUser', newUser['email']!);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BottomNavScreen(allBooks: widget.allBooks),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
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
            ElevatedButton(onPressed: signup, child: const Text('Sign Up')),
            const SizedBox(height: 10),
            Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
