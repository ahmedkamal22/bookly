import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewWidget extends StatelessWidget {
  const BookDetailsViewWidget(
      {super.key, required this.model, required this.books});

  final BookEntity model;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                BooDetailsSection(
                  model: model,
                ),
                const Expanded(child: SizedBox(height: AppSize.s37)),
                SimilarBooksSection(books: books),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
