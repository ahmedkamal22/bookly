import 'package:bookly/features/splash/presentation/widgets/splash_view_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewWidget(),
    );
  }
}
