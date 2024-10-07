import 'package:bookly/core/utils/widgets/custom_loading_animation.dart';
import 'package:bookly/features/home/presentation/widgets/custom_best_seller_widget_loading.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values_manager.dart';

class CustomBestSellerListviewWidgetLoading extends StatelessWidget {
  const CustomBestSellerListviewWidgetLoading(
      {super.key, required this.isScrollable});

  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return CustomLoadingAnimation(
      child: ListView.separated(
          shrinkWrap: true,
          physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              const CustomBestSellerWidgetLoading(),
          separatorBuilder: (context, index) => const SizedBox(
                height: AppSize.s20,
              ),
          itemCount: 20),
    );
  }
}
