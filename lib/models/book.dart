import 'dart:convert';

class Book {
  String title;
  String author;
  String image;
  String description;
  bool isFavorite;
  String readingStatus;
  DateTime addedAt;

  Book({
    required this.title,
    this.author = '',
    this.image = '',
    this.description = '',
    this.isFavorite = false,
    this.readingStatus = '',
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'image': image,
      'description': description,
      'isFavorite': isFavorite,
      'readingStatus': readingStatus,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'],
      author: map['author'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      readingStatus: map['readingStatus'] ?? '',
      addedAt: DateTime.parse(map['addedAt']),
    );
  }

  static String encode(List<Book> books) =>
      json.encode(books.map((b) => b.toMap()).toList());

  static List<Book> decode(String booksString) =>
      (json.decode(booksString) as List<dynamic>)
          .map<Book>((item) => Book.fromMap(item))
          .toList();
}
