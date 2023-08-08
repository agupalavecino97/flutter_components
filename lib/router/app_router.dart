import 'package:flutter/material.dart';
import 'package:flutter_components/screens/screens.dart';

import '../models/models.dart';

class AppRoutes {
  static const initialRouter = '/home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: '/home',
        name: 'Home Screen',
        scren: const HomeScreen(),
        icon: Icons.home),
    MenuOption(
        route: '/listview1',
        name: 'List View tipo 1',
        scren: const ListView1Screen(),
        icon: Icons.list),
    MenuOption(
        route: '/listview2',
        name: 'List View tipo 2',
        scren: const ListView2Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: '/alert',
        name: 'Alertas',
        scren: const AlertScreen(),
        icon: Icons.add_alert_outlined),
    MenuOption(
        route: '/card',
        name: 'Tarjetas',
        scren: const CardScreen(),
        icon: Icons.credit_card_rounded),
    MenuOption(
        route: '/avatar',
        name: 'Avatar',
        scren: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.scren});
    }
    return appRoutes;
  }
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   '/home': (BuildContext context) => const HomeScreen(),
  //   '/ListView1': (BuildContext context) => const ListView1Screen(),
  //   '/ListView2': (BuildContext context) => const ListView2Screen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settigns) {
    // para cuando no se encuentre una ruta
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
