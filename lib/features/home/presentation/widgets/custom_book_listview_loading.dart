import 'package:bookly/core/utils/widgets/custom_loading_animation.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_image_loading.dart';
import 'package:flutter/material.dart';

class CustomBooksListviewLoading extends StatefulWidget {
  const CustomBooksListviewLoading({super.key});

  @override
  State<CustomBooksListviewLoading> createState() =>
      _CustomBooksListviewLoadingState();
}

class _CustomBooksListviewLoadingState
    extends State<CustomBooksListviewLoading> {
  @override
  Widget build(BuildContext context) {
    return CustomLoadingAnimation(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const CustomBookImageLoading(),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 15),
    );
  }
}
