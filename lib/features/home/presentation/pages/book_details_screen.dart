import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_view_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen(
      {super.key, required this.model, required this.books});

  final BookEntity model;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.close_outlined),
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: BookDetailsViewWidget(
        model: model,
        books: books,
      ),
    );
  }
}
