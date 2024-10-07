import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.radius,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: getBoldStyle(
            fontSize: AppSize.s15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
