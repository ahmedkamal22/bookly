import 'package:bookly/core/utils/images.dart';
import 'package:bookly/core/utils/widgets/custom_navigation_widgets.dart';
import 'package:bookly/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.logo,
            height: 16,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 17,
            ),
            onPressed: () {
              navigateTo(context: context, location: const SearchScreen());
            },
          ),
        ],
      ),
    );
  }
}
