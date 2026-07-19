import 'package:flutter/material.dart'
    show GlobalKey, NavigatorState, BuildContext, MediaQuery;


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool isiPad(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return size.shortestSide >= 600;
}
