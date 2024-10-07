import 'package:bookly/core/utils/fonts_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {required double fontSize,
    Color color = Colors.white,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.regular, color);
}

TextStyle getLightStyle(
    {required double fontSize,
    Color color = Colors.white,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.light, color);
}

TextStyle getBoldStyle(
    {required double fontSize,
    Color color = Colors.white,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.bold, color);
}

TextStyle getSemiBoldStyle(
    {required double fontSize,
    Color color = Colors.white,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semiBold, color);
}

TextStyle getMediumStyle(
    {required double fontSize,
    Color color = Colors.white,
    String fontFamily = FontConstants.fontFamily}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.medium, color);
}
