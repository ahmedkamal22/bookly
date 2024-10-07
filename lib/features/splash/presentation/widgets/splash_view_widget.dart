import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/images.dart';
import 'package:bookly/core/utils/widgets/custom_navigation_widgets.dart';
import 'package:bookly/features/home/presentation/pages/home_screen.dart';
import 'package:bookly/features/splash/presentation/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewWidget extends StatefulWidget {
  const SplashViewWidget({super.key});

  @override
  State<SplashViewWidget> createState() => _SplashViewWidgetState();
}

class _SplashViewWidgetState extends State<SplashViewWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
    _navigateToHomeScreen();
  }

  void _initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void _navigateToHomeScreen() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        if (mounted) {
          navigateToAndFinish(
              context: context,
              duration: kDuration,
              location: const HomeScreen());
        }
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          Assets.logo,
          height: 60,
        ),
        const SizedBox(
          height: 20,
        ),
        SlidingText(
          slidingAnimation: slidingAnimation,
        ),
      ],
    );
  }
}
