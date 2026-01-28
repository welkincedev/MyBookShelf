import 'package:flutter/material.dart';
import '../models/book.dart';

class SearchScreen extends StatefulWidget {
  final List<Book> allBooks;
  final VoidCallback onUpdate;

  const SearchScreen({
    super.key,
    required this.allBooks,
    required this.onUpdate,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = widget.allBooks;
  }

  void _searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBooks = widget.allBooks;
      } else {
        filteredBooks = widget.allBooks
            .where(
              (book) =>
                  book.title.toLowerCase().contains(query.toLowerCase()) ||
                  book.author.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Books")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Search by title or author",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _searchBooks, // 🔥 THIS IS KEY
            ),
          ),
          Expanded(
            child: filteredBooks.isEmpty
                ? const Center(child: Text("No books found"))
                : ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = filteredBooks[index];
                      return ListTile(
                        title: Text(book.title),
                        subtitle: Text(book.author),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
