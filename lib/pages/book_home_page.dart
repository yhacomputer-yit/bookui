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
      imageUrl: 'https://strapi-spaces-storage.sgp1.digitaloceanspaces.com/mmReaderPlus/mmReaderPlus_Thumbnail/%E1%80%90%E1%80%AC%E1%80%9B%E1%80%AC%E1%80%99%E1%80%84%E1%80%BA%E1%80%B8%E1%80%9D%E1%80%B1_%E1%80%95%E1%80%84%E1%80%BA%E1%80%9C%E1%80%9A%E1%80%BA%E1%80%A1%E1%80%90%E1%80%AF%E1%80%91%E1%80%B2%E1%80%80%E1%80%80%E1%80%BB%E1%80%BD%E1%80%94%E1%80%BA%E1%80%B8_20260222181232.jpg',
      category: 'ရသ | လုံးချင်းဝတ္ထု',
      pageNumber: 254,
    ),


    Book(
      id: 2,
      title: 'ဇော်ကကနေသည်',
      author: 'အကြည်တော်',
      description: 'A story of racism and innocence in the American South.',
      imageUrl: 'https://strapi-spaces-storage.sgp1.digitaloceanspaces.com/mmReaderPlus/mmReaderPlus_Thumbnail/%E1%80%A1%E1%80%80%E1%80%BC%E1%80%8A%E1%80%BA%E1%80%90%E1%80%B1%E1%80%AC%E1%80%BA_%E1%80%87%E1%80%B1%E1%80%AC%E1%80%BA%E1%80%80%E1%80%80%E1%80%94%E1%80%B1%E1%80%9E%E1%80%8A%E1%80%BA_20260222181234.jpg',
      category: 'ရသ | လုံးချင်းဝတ္ထု',
      pageNumber: 281,
    ),


    Book(
      id: 3,
      title: 'တမလွန်',
      author: 'အောင်ခင်စိုး',
      description: 'A dystopian novel about totalitarianism.',
      imageUrl: 'https://strapi-spaces-storage.sgp1.digitaloceanspaces.com/mmReaderPlus/mmReaderPlus_Thumbnail/%E1%80%A1%E1%80%B1%E1%80%AC%E1%80%84%E1%80%BA%E1%80%81%E1%80%84%E1%80%BA%E1%80%85%E1%80%AD%E1%80%AF%E1%80%B8_%E1%80%90%E1%80%99%E1%80%9C%E1%80%BD%E1%80%94%E1%80%BA_20260222181240.jpg',
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

