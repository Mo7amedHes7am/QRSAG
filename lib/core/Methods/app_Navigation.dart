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
  static final List<Route<dynamic>> _routeStack = [];
  static final Map<Route<dynamic>, Widget> _routeScreens = {};

  static final NavigatorObserver observer = _AppNavigatorObserver();

  static Widget? getLastPage() {
    if (_routeStack.length < 2) return null;
    final previousRoute = _routeStack[_routeStack.length - 2];
    return _routeScreens[previousRoute];
  }

  static Route<dynamic>? getLastRoute() {
    if (_routeStack.length < 2) return null;
    return _routeStack[_routeStack.length - 2];
  }

  static Widget? getPageAt(int indexFromTop) {
    final index = _routeStack.length - 1 - indexFromTop;
    if (index < 0 || index >= _routeStack.length) return null;
    return _routeScreens[_routeStack[index]];
  }

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
    final route = PageRouteBuilder(
      maintainState: true,
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(animation, child, transition, curve);
      },
    );

    _routeScreens[route] = screen;
    return route;
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

class _AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    AppNavigator._routeStack.add(route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    AppNavigator._routeStack.remove(route);
    AppNavigator._routeScreens.remove(route);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    AppNavigator._routeStack.remove(route);
    AppNavigator._routeScreens.remove(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null && newRoute != null) {
      final index = AppNavigator._routeStack.indexOf(oldRoute);
      if (index != -1) {
        AppNavigator._routeStack[index] = newRoute;
      }
      AppNavigator._routeScreens.remove(oldRoute);
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
