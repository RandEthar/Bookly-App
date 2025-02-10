
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {



  static const String kHomeView='/homeView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),


       GoRoute(
      path:kHomeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
     
    ),
    ],
  );
}
