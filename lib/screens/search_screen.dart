import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_details_screen.dart';
import '../screens/add_book_screen.dart';
import '../screens/scan_book_screen.dart';
import '../services/api_service.dart';
import '../services/local_storage.dart';

class SearchScreen extends StatefulWidget {
  final List<Book> allBooks;
  final VoidCallback? onUpdate;

  const SearchScreen({super.key, required this.allBooks, this.onUpdate});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  List<Book> searchResults = [];
  bool isLoading = false;

  Future<void> searchBooks(String query) async {
    if (query.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    final results = await ApiService.searchBooks(query);

    setState(() {
      searchResults = results;
      isLoading = false;
    });
  }

  void addBook(Book book) {
    widget.allBooks.add(book);
    LocalStorage.saveBooks(widget.allBooks);
    widget.onUpdate?.call();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Book added to shelf')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Books')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search books online...',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => searchBooks(controller.text),
                ),
              ),
              onSubmitted: searchBooks,
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ),

          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final book = searchResults[index];

                return ListTile(
                  leading: Image.network(
                    book.image,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.book),
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => addBook(book),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookDetailsScreen(
                        book: book,
                        onFavoriteToggle: () {},
                        onStatusUpdate: (_) {},
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addBook',
            child: const Icon(Icons.add),
            onPressed: () async {
              final Book? newBook = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddBookScreen()),
              );
              if (newBook != null) addBook(newBook);
            },
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'scanBook',
            child: const Icon(Icons.qr_code_scanner),
            onPressed: () async {
              final String? isbn = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ScanBookScreen()),
              );
              if (isbn != null) {
                final book = await ApiService.fetchBookByISBN(isbn);
                if (book != null) addBook(book);
              }
            },
          ),
        ],
      ),
    );
  }
}
