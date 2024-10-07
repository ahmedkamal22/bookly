import 'package:bookly/core/utils/widgets/error_snack_bar.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books/cubit.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books/states.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_listview.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_listview_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedBooksWidget extends StatefulWidget {
  const FetchFeaturedBooksWidget({super.key, this.height});

  final double? height;

  @override
  State<FetchFeaturedBooksWidget> createState() =>
      _FetchFeaturedBooksWidgetState();
}

class _FetchFeaturedBooksWidgetState extends State<FetchFeaturedBooksWidget> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksStates>(
      listener: (context, state) {
        if (state is FetchFeaturedBooksSuccessState) {
          books.addAll(state.books);
        } else if (state is FetchFeaturedBooksPaginationFailureState) {
          showErrorSnackBar(context, state);
        }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccessState ||
            state is FetchFeaturedBooksPaginationLoadingState ||
            state is FetchFeaturedBooksPaginationFailureState) {
          return SizedBox(
              height: widget.height ?? MediaQuery.sizeOf(context).height * .27,
              child: CustomBooksListview(
                books: books,
              ));
        } else if (state is FetchFeaturedBooksFailureState) {
          return Text(state.msg.toString());
        } else {
          return SizedBox(
              height: widget.height ?? MediaQuery.sizeOf(context).height * .27,
              child: const CustomBooksListviewLoading());
        }
      },
    );
  }
}
