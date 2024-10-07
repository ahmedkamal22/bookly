import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/core/utils/widgets/custom_navigation_widgets.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/pages/book_details_screen.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/widgets/custom_rating_widget.dart';
import 'package:flutter/material.dart';

class CustomBestSellerWidget extends StatelessWidget {
  const CustomBestSellerWidget(
      {super.key, required this.model, required this.books});

  final BookEntity model;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(
          context: context,
          location: BookDetailsScreen(
            books: books,
            model: model,
          )),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .16,
        child: Row(
          children: [
            CustomBookImage(
              image: model.image ?? kDefaultImageUrl,
            ),
            const SizedBox(width: AppSize.s20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.title ?? 'Harry Potter and the Goblet of Fire',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: getRegularStyle(fontSize: AppSize.s20),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Text(
                    model.authorName ?? 'J.K. Rowling',
                    style: getMediumStyle(
                        fontSize: AppSize.s14,
                        color: Colors.white.withOpacity(.7)),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: getBoldStyle(fontSize: AppSize.s15),
                      ),
                      const Spacer(),
                      CustomRatingWidget(
                        rating: model.rating ?? 0,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
