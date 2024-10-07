import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(endPoint: booksEndPoint, queryParameters: {
      'filtering': 'free-ebooks',
      'q': 'programming',
      'startIndex': pageNumber * 10,
    });
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(endPoint: booksEndPoint, queryParameters: {
      'Filtering': 'free-ebooks',
      'q': 'programming',
      'Sorting': 'newest',
      'startIndex': pageNumber * 10,
    });
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kNewestBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookData in data['items']) {
      books.add(BookModel.fromJson(bookData));
    }
    return books;
  }
}
