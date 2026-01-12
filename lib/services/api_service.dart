import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  // Fetch books by search query from Google Books
  static Future<List<Book>> searchBooks(String query) async {
    final encodedQuery = Uri.encodeQueryComponent(query);
    final url = 'https://www.googleapis.com/books/v1/volumes?q=$encodedQuery';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List items = data['items'] ?? [];
      return items.map((item) {
        final volumeInfo = item['volumeInfo'];
        return Book(
          title: volumeInfo['title'] ?? 'No title',
          author: (volumeInfo['authors'] != null)
              ? volumeInfo['authors'][0]
              : 'Unknown author',
          image: (volumeInfo['imageLinks'] != null)
              ? volumeInfo['imageLinks']['thumbnail']
              : 'https://covers.openlibrary.org/b/id/10523358-L.jpg',
        );
      }).toList();
    }
    return [];
  }

  // Fetch book by ISBN
  static Future<Book?> fetchBookByISBN(String isbn) async {
    final url = 'https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if ((data['items'] ?? []).isNotEmpty) {
        final volumeInfo = data['items'][0]['volumeInfo'];
        return Book(
          title: volumeInfo['title'] ?? 'No title',
          author: (volumeInfo['authors'] != null)
              ? volumeInfo['authors'][0]
              : 'Unknown author',
          image: (volumeInfo['imageLinks'] != null)
              ? volumeInfo['imageLinks']['thumbnail']
              : 'https://covers.openlibrary.org/b/id/10523358-L.jpg',
        );
      }
    }
    return null;
  }
}
