import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/scaling_logo.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimationText;
  late Animation<Offset> slidingAnimationLogo;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    NavigateToHome();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScalingLogo(scaleAnimation: scaleAnimation),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimationText)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    slidingAnimationText =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.easeInOutBack));
    slidingAnimationLogo = Tween<Offset>(begin: Offset(0, -2), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack));

    scaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack));
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
      /*Get.to(() => const HomeView(),
          transition: Transition.rightToLeftWithFade,
          duration: kTranstionDuration);*/
    });
  }
}
