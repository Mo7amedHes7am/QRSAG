import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Transition {
  defaultTransition,
  fade,
  scale,
  slide,
  rotation,
  size,
  circularReveal,
}

class AppNavigator {
  static Future<T?> topage<T>(
    BuildContext context,
    Widget screen, {
    Transition transition = Transition.defaultTransition,
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(
      context,
      _buildRoute(screen, transition, curve, duration) as Route<T>,
    );
  }

  static Future<T?> toPageWithCubit<T, C extends BlocBase>({
    required BuildContext context,
    required C cubit,
    required Widget screen,
    Transition transition = Transition.defaultTransition,
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(
      context,
      _buildRoute(
            BlocProvider.value(value: cubit, child: screen),
            transition,
            curve,
            duration,
          )
          as Route<T>,
    );
  }

  static Future<T?> offpage<T>(
    BuildContext context,
    Widget screen, {
    Transition transition = Transition.defaultTransition,
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.pushReplacement<T, T>(
      context,
      _buildRoute(screen, transition, curve, duration) as Route<T>,
    );
  }

  static Future<T?> offPageWithCubit<T, C extends BlocBase>({
    required BuildContext context,
    required C cubit,
    required Widget screen,
    Transition transition = Transition.defaultTransition,
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.pushReplacement<T, T>(
      context,
      _buildRoute(
            BlocProvider.value(value: cubit, child: screen),
            transition,
            curve,
            duration,
          )
          as Route<T>,
    );
  }

  static Future<T?> offallpages<T>(
    BuildContext context,
    Widget screen, {
    Transition transition = Transition.defaultTransition,
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
  }) async {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      _buildRoute(screen, transition, curve, duration) as Route<T>,
      (route) => false,
    );
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void backwithresult(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }

  static void backuntil(BuildContext context, String name) {
    Navigator.popUntil(context, ModalRoute.withName(name));
  }

  static bool canpop(BuildContext context) {
    return Navigator.canPop(context);
  }

  static void gotofirst(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  static dynamic getargs(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments;
  }

  static PageRouteBuilder _buildRoute(
    Widget screen,
    Transition transition,
    Curve curve,
    Duration duration,
  ) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(animation, child, transition, curve);
      },
    );
  }

  static Widget _buildTransition(
    Animation<double> animation,
    Widget child,
    Transition transition,
    Curve curve,
  ) {
    final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

    switch (transition) {
      case Transition.circularReveal:
        return CircularRevealAnimation(
          animation: curvedAnimation,
          child: child,
        );
      case Transition.fade:
        return FadeTransition(opacity: curvedAnimation, child: child);
      case Transition.scale:
        return ScaleTransition(scale: curvedAnimation, child: child);
      case Transition.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      case Transition.rotation:
        return RotationTransition(turns: curvedAnimation, child: child);
      case Transition.size:
        return SizeTransition(sizeFactor: curvedAnimation, child: child);
      default:
        return FadeTransition(opacity: curvedAnimation, child: child);
    }
  }
}

class CircularRevealAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const CircularRevealAnimation({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return ClipPath(
          clipper: CircularRevealClipper(fraction: animation.value),
          child: child,
        );
      },
      child: child,
    );
  }
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;

  CircularRevealClipper({required this.fraction});

  @override
  Path getClip(Size size) {
    final radius = fraction * size.longestSide;

    return Path()..addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: radius,
      ),
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
