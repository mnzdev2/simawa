import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simawa/constants/route_constants.dart';
import 'package:simawa/journey/home/presentation/home_page.dart';
import 'package:simawa/journey/login/presentation/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initialPage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteConstants.settingPage:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('settings screen'),
          ),
        );
      case RouteConstants.loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      default:
        _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('PAGE NOT FOUND!!!'),
          ),
        );
      },
    );
  }
}
