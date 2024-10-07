import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    return getLocalDataFromHive(
        boxName: kFeaturedBooks, pageNumber: pageNumber);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    return getLocalDataFromHive(boxName: kNewestBooks, pageNumber: pageNumber);
  }

  List<BookEntity> getLocalDataFromHive({
    required String boxName,
    required int pageNumber,
  }) {
    int start = pageNumber * 10;
    int end = (pageNumber + 1) * 10;
    Box<BookEntity> box = Hive.box(boxName);
    int length = box.values.length;
    if (start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }
}
