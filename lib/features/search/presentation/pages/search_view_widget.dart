import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/presentation/widgets/custom_best_seller_listview.dart';
import 'package:bookly/features/search/presentation/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends StatelessWidget {
  const SearchViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
            child: Text(
              'Search Result',
              style: getSemiBoldStyle(fontSize: AppSize.s18),
            ),
          ),
          const Expanded(
              child: CustomBestSellerListview(
            isScrollable: true,
          )),
        ],
      ),
    );
  }
}
