import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/local_storage.dart';
import 'book_details_screen.dart';

class ShelfScreen extends StatefulWidget {
  final List<Book> allBooks;
  final VoidCallback? onUpdate;

  const ShelfScreen({super.key, required this.allBooks, this.onUpdate});

  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {
  void toggleFavorite(Book book) {
    setState(() => book.isFavorite = !book.isFavorite);
    LocalStorage.saveBooks(widget.allBooks);
    widget.onUpdate?.call();
  }

  void updateReadingStatus(Book book, String status) {
    setState(() => book.readingStatus = status);
    LocalStorage.saveBooks(widget.allBooks);
    widget.onUpdate?.call();
  }

  @override
  Widget build(BuildContext context) {
    List<Book> shelfBooks = widget.allBooks;

    return Scaffold(
      appBar: AppBar(title: const Text('My Shelf')),
      body: shelfBooks.isEmpty
          ? const Center(child: Text('No books in your shelf yet.'))
          : ListView.builder(
              itemCount: shelfBooks.length,
              itemBuilder: (_, index) {
                Book book = shelfBooks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: Image.network(
                      book.image,
                      width: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.book, size: 50),
                    ),
                    title: Text(book.title),
                    subtitle: Text(
                      'Status: ${book.readingStatus.isEmpty ? "Not Started" : book.readingStatus}',
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        book.isFavorite ? Icons.star : Icons.star_border,
                        color: Colors.yellow[700],
                      ),
                      onPressed: () => toggleFavorite(book),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailsScreen(
                            book: book,
                            onFavoriteToggle: () => toggleFavorite(book),
                            onStatusUpdate: (status) =>
                                updateReadingStatus(book, status),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
