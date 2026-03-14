import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_details_page.dart';

class BookHomePage extends StatefulWidget {
  const BookHomePage({super.key});

  @override
  State<BookHomePage> createState() => _BookHomePageState();
}

class _BookHomePageState extends State<BookHomePage> {
  // Sample books data
  final List<Book> _books = const [
    Book(
      id: 1,
      title: 'ပင်လယ်အတုထဲကကျွန်း',
      author: 'တာရာမင်းဝေ',
      description: 'A novel about the American Dream and tragedy.',
      imageUrl: 'https://danbrown.com/wp-content/uploads/2025/01/Dan-Brown_The-Secret-of-Secrets-book-cover-400x624.jpg',
      category: 'ရသ | လုံးချင်းဝတ္ထု',
      pageNumber: 254,
    ),


    Book(
      id: 2,
      title: 'ဇော်ကကနေသည်',
      author: 'အကြည်တော်',
      description: 'A story of racism and innocence in the American South.',
    imageUrl: 'https://danbrown.com/wp-content/uploads/2025/01/Dan-Brown_The-Secret-of-Secrets-book-cover-400x624.jpg',
      category: 'ရသ | လုံးချင်းဝတ္ထု',
      pageNumber: 281,
    ),


    Book(
      id: 3,
      title: 'တမလွန်',
      author: 'အောင်ခင်စိုး',
      description: 'A dystopian novel about totalitarianism.',
      imageUrl: 'https://danbrown.com/wp-content/uploads/2025/01/Dan-Brown_The-Secret-of-Secrets-book-cover-400x624.jpg',
      category: 'ရသ | လုံးချင်းဝတ္ထု',
      pageNumber: 328,
    ),


  ];

  void _navigateToBookDetails(Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Library'),
        backgroundColor: Colors.orange[800],

      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return Card(
            elevation: 4,
            child: InkWell(
              // onTap: () => _navigateToBookDetails(book), // Button handles navigation

              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      book.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        color: Colors.orange[200],
                        child: const Icon(Icons.book, size: 60, color: Colors.orange),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                book.author,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _navigateToBookDetails(book),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[600],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 4),
                              ),
                              child: const Text('View Details'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),

    );
  }
}

