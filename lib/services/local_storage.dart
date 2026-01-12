import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';

class LocalStorage {
  static const String booksKey = 'books';

  static Future<void> saveBooks(List<Book> books) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(booksKey, Book.encode(books));
  }

  static Future<List<Book>> loadBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final booksString = prefs.getString(booksKey);
    if (booksString != null) {
      return Book.decode(booksString);
    }
    return [];
  }
}
