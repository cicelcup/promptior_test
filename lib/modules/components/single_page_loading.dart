import 'package:flutter/material.dart';

class SinglePageLoading extends StatelessWidget {
  const SinglePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
