import 'package:bookly/features/home/presentation/widgets/home_view_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewWidget(),
    );
  }
}
