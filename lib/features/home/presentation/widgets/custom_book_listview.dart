import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books/cubit.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBooksListview extends StatefulWidget {
  const CustomBooksListview({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<CustomBooksListview> createState() => _CustomBooksListviewState();
}

class _CustomBooksListviewState extends State<CustomBooksListview> {
  final ScrollController _scrollController = ScrollController();
  int nextIndex = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    var currentScroll = _scrollController.position.pixels;
    var maxScroll = _scrollController.position.maxScrollExtent;
    if (currentScroll >= 0.7 * maxScroll) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FetchFeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextIndex++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomBookImage(
              image: widget.books[index].image ?? kDefaultImageUrl,
            ),
        separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
        itemCount: widget.books.length);
  }
}
