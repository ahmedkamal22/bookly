import 'package:bookly/core/utils/widgets/error_snack_bar.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/fetch_newest_books/cubit.dart';
import 'package:bookly/features/home/presentation/manager/fetch_newest_books/states.dart';
import 'package:bookly/features/home/presentation/widgets/custom_best_seller_listview_widget_loading.dart';
import 'package:bookly/features/home/presentation/widgets/custom_best_seller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/values_manager.dart';

class CustomBestSellerListview extends StatefulWidget {
  const CustomBestSellerListview({super.key, required this.isScrollable});

  final bool isScrollable;

  @override
  State<CustomBestSellerListview> createState() =>
      _CustomBestSellerListviewState();
}

class _CustomBestSellerListviewState extends State<CustomBestSellerListview> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksStates>(
      listener: (context, state) {
        if (state is FetchNewestBooksSuccessState) {
          books.addAll(state.books);
        } else if (state is FetchNewestBooksPaginationFailureState) {
          showErrorSnackBar(context, state);
        }
      },
      builder: (context, state) {
        if (state is FetchNewestBooksSuccessState ||
            state is FetchNewestBooksPaginationLoadingState ||
            state is FetchNewestBooksPaginationFailureState) {
          return ListView.separated(
              shrinkWrap: true,
              physics: widget.isScrollable
                  ? null
                  : const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CustomBestSellerWidget(
                    model: books[index],
                    books: books,
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: AppSize.s20,
                  ),
              itemCount: books.length);
        } else if (state is FetchNewestBooksFailureState) {
          return Text(state.msg.toString());
        } else {
          return CustomBestSellerListviewWidgetLoading(
              isScrollable: widget.isScrollable);
        }
      },
    );
  }
}
