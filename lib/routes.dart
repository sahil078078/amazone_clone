import 'package:amazone_clone/features/auth/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const AuthScreen(),
        settings: routeSettings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen don\'t exist '),
          ),
        ),
        settings: routeSettings,
      );
  }
}
