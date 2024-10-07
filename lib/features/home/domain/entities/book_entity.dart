import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  String? bookId;
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? authorName;
  @HiveField(4)
  num? price;
  @HiveField(5)
  num? rating;

  BookEntity(
      {required this.bookId,
      required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating});
}
