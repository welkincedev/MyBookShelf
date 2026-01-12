import 'package:flutter/material.dart';
import '../models/book.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'shelf_screen.dart';
import 'profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  final List<Book> allBooks;

  const BottomNavScreen({super.key, required this.allBooks});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  void refresh() {
    setState(() {}); // refresh UI when books are updated
  }

  @override
  Widget build(BuildContext context) {
    // Screens for each tab
    List<Widget> screens = [
      HomeScreen(allBooks: widget.allBooks, onUpdate: refresh),
      SearchScreen(allBooks: widget.allBooks, onUpdate: refresh),
      ShelfScreen(allBooks: widget.allBooks, onUpdate: refresh),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Shelf',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
