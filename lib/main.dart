import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/book.dart';
import 'services/local_storage.dart';
import 'screens/bottom_nav_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List<Book> savedBooks = await LocalStorage.loadBooks();

  runApp(BookShelfApp(allBooks: savedBooks));
}

class BookShelfApp extends StatelessWidget {
  final List<Book> allBooks;

  const BookShelfApp({super.key, required this.allBooks});

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('loggedInUser') != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookShelf',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<bool>(
        future: checkLogin(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == true) {
            // User is logged in → show BottomNavScreen
            return BottomNavScreen(allBooks: allBooks);
          } else {
            // User not logged in → show LoginScreen
            return LoginScreen(allBooks: allBooks);
          }
        },
      ),
    );
  }
}
