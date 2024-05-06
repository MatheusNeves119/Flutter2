
import 'package:flutter/widgets.dart';
import 'package:puc_minas/app/features/home/home_page.dart';
import 'package:puc_minas/app/features/splash/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
        '/': (context) => SplashPage(),
        '/home': (context) => HomePage(),
  };
}