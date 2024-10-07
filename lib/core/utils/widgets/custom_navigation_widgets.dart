import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';

navigateTo({
  required BuildContext context,
  Duration duration = kDuration,
  required Widget location,
}) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: duration, // Use custom duration
      pageBuilder: (context, animation, secondaryAnimation) => location,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(5.0, 0.8);
        var end = Offset.zero;
        var curve = Curves.fastLinearToSlowEaseIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}

navigateToAndFinish({
  required BuildContext context,
  Duration duration = kDuration,
  required Widget location,
}) {
  return Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => location,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(5.0, 0.8);
        var end = Offset.zero;
        var curve = Curves.fastLinearToSlowEaseIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
    (route) => false,
  );
}
