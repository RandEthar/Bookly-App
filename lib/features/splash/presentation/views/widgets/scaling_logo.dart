import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ScalingLogo extends StatelessWidget {
  const ScalingLogo({
    super.key,
    required this.scaleAnimation,
  });

  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return ScaleTransition(
            scale: scaleAnimation, child: Image.asset(AssetsData.logo));
      },
    );
  }
}
