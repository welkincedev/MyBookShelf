import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> allBooks;
  final VoidCallback? onUpdate;

  const HomeScreen({super.key, required this.allBooks, this.onUpdate});

  @override
  Widget build(BuildContext context) {
    // Sort by addedAt descending for recent books
    List<Book> recentBooks = List.from(allBooks)
      ..sort((a, b) => b.addedAt.compareTo(a.addedAt));

    List<Book> favoriteBooks = allBooks
        .where((book) => book.isFavorite)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recent Books',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentBooks.length,
                  itemBuilder: (_, index) {
                    Book book = recentBooks[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookDetailsScreen(
                              book: book,
                              onFavoriteToggle: () {
                                onUpdate?.call();
                              },
                              onStatusUpdate: (_) => onUpdate?.call(),
                            ),
                          ),
                        );
                        onUpdate?.call();
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Image.network(
                              book.image,
                              height: 120,
                              width: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.book, size: 80),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              book.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Favorite Books',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              favoriteBooks.isEmpty
                  ? const Text('No favorite books yet.')
                  : SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favoriteBooks.length,
                        itemBuilder: (_, index) {
                          Book book = favoriteBooks[index];
                          return GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookDetailsScreen(
                                    book: book,
                                    onFavoriteToggle: () => onUpdate?.call(),
                                    onStatusUpdate: (_) => onUpdate?.call(),
                                  ),
                                ),
                              );
                              onUpdate?.call();
                            },
                            child: Container(
                              width: 120,
                              margin: const EdgeInsets.only(right: 12),
                              child: Column(
                                children: [
                                  Image.network(
                                    book.image,
                                    height: 120,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.book, size: 80),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    book.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
