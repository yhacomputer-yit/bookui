class Book {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final String category;
  final int pageNumber;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.pageNumber,
  });



  @override
  String toString() => 'Book(id: $id, title: $title, author: $author)';
}

