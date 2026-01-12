import 'package:flutter/material.dart';

import 'models/book.dart';
import 'services/local_storage.dart';
import 'screens/bottom_nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List<Book> savedBooks = await LocalStorage.loadBooks();

  runApp(BookShelfApp(allBooks: savedBooks));
}

class BookShelfApp extends StatelessWidget {
  final List<Book> allBooks;

  const BookShelfApp({super.key, required this.allBooks});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookShelf',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BottomNavScreen(allBooks: allBooks),
    );
  }
}
