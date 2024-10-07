import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, state) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.redAccent,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    content: Text(
      state.msg,
      style: const TextStyle(color: Colors.white),
    ),
  ));
}
