import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/features/home/presentation/manager/fetch_newest_books/cubit.dart';
import 'package:bookly/features/home/presentation/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/widgets/custom_best_seller_listview.dart';
import 'package:bookly/features/home/presentation/widgets/fetch_featured_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/values_manager.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({super.key});

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  final ScrollController _scrollController = ScrollController();
  int nextIndex = 1;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollToNext);
    super.initState();
  }

  void _scrollToNext() {
    var currentIndex = _scrollController.position.pixels;
    var maxIndex = _scrollController.position.maxScrollExtent;
    if (currentIndex >= 0.7 * maxIndex) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<FetchNewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextIndex++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(),
                const FetchFeaturedBooksWidget(),
                const SizedBox(height: AppSize.s50),
                Text(
                  'Newest Books',
                  style: getSemiBoldStyle(fontSize: AppSize.s18),
                ),
                const SizedBox(height: AppSize.s10),
                const CustomBestSellerListview(
                  isScrollable: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
