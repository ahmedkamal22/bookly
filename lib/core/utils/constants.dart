import 'dart:ui';

import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const Color kPrimaryColor = Color(0xff100B20);
const Duration kDuration = Duration(milliseconds: 300);

const String booksBaseUrl = 'https://www.googleapis.com/books/v1/';
const String booksEndPoint = 'volumes';

const String kFeaturedBooks = 'featured_books';
const String kNewestBooks = 'newest_books';

const String kDefaultImageUrl =
    'https://collegeinfogeek.com/wp-content/uploads/2018/11/Essential-Books.jpg';

void saveBooksData({required List<BookEntity> books, required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
