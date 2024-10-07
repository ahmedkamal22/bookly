import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/core/utils/widgets/custom_button.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/widgets/custom_rating_widget.dart';
import 'package:flutter/material.dart';

class BooDetailsSection extends StatelessWidget {
  const BooDetailsSection({super.key, required this.model});

  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * .4,
            child: Center(
                child: CustomBookImage(
              image: model.image ?? kDefaultImageUrl,
            ))),
        const SizedBox(height: AppSize.s43),
        Text(
          model.title ?? 'The Jungle Book',
          textAlign: TextAlign.center,
          style: getBoldStyle(fontSize: AppSize.s20),
        ),
        const SizedBox(height: AppSize.s5),
        Text(
          model.authorName ?? 'Rudyard Kipling',
          style: getMediumStyle(
              fontSize: AppSize.s18, color: Colors.white.withOpacity(.7)),
        ),
        const SizedBox(height: AppSize.s18),
        CustomRatingWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: model.rating ?? 0,
        ),
        const SizedBox(height: AppSize.s37),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                  text: model.price.toString() ?? '19.99€',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  radius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s16),
                    bottomLeft: Radius.circular(AppSize.s16),
                  )),
            ),
            const Expanded(
              child: CustomButton(
                  text: 'Free preview',
                  backgroundColor: Color(0xffEF8262),
                  textColor: Colors.white,
                  radius: BorderRadius.only(
                    topRight: Radius.circular(AppSize.s16),
                    bottomRight: Radius.circular(AppSize.s16),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
