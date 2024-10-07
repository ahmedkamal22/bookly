import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_listview.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: getSemiBoldStyle(fontSize: AppSize.s14),
        ),
        const SizedBox(height: AppSize.s16),
        SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: CustomBooksListview(books: books)),
        const SizedBox(height: AppSize.s40),
      ],
    );
  }
}
