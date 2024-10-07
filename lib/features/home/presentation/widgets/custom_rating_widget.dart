import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating});

  final MainAxisAlignment mainAxisAlignment;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amberAccent,
          size: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            rating.toString(),
            style: getMediumStyle(fontSize: AppSize.s16),
          ),
        ),
        Text(
          '(2390)',
          style: getRegularStyle(
              fontSize: AppSize.s14, color: Colors.white.withOpacity(.5)),
        ),
      ],
    );
  }
}
