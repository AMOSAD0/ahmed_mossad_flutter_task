import 'package:ahmed_mossad_flutter_task/features/home/presentation/pages/home_page.dart';
import 'package:ahmed_mossad_flutter_task/features/plans_selected/presentation/page/plans_selected_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => buildTransitionPage(const HomePage()),
    ),

    GoRoute(
      path: '/plans',
      name: 'plans',
      pageBuilder: (context, state) =>
          buildTransitionPage(const PlansSelectedPage()),
    ),
  ],
);

CustomTransitionPage buildTransitionPage(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 550),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
    },
    child: child,
  );
}
