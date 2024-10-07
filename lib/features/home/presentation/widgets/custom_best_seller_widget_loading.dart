import 'package:bookly/features/home/presentation/widgets/custom_book_image_loading.dart';
import 'package:flutter/material.dart';

class CustomBestSellerWidgetLoading extends StatelessWidget {
  const CustomBestSellerWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .16,
      child: Row(
        children: [
          const CustomBookImageLoading(),
          const SizedBox(width: 16),
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.grey[300],
                )),
          ),
        ],
      ),
    );
  }
}
