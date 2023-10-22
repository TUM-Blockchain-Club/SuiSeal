import 'package:flutter/material.dart' hide BottomNavigationBar, BottomNavigationBarItem;
import 'package:tbcxsui/views/app_home/view_authenticate.dart';
import 'package:tbcxsui/views/app_home/view_authenticate_result.dart';
import 'package:tbcxsui/views/app_home/view_home/view_home.dart';
import 'package:tbcxsui/views/app_home/view_sneaker_detail.dart';
import 'package:tbcxsui/models/models.dart' as model;
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuiSeal',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(settings: const RouteSettings(name: '/'), builder: (context) => const ViewHome());
          case '/sneaker':
            var sneaker = settings.arguments as model.Sneaker;
            return MaterialPageRoute(settings: const RouteSettings(name: '/sneaker'), builder: (context) => ViewSneakerDetail(sneaker: sneaker));
          case '/authenticate':
            var sneaker = settings.arguments as model.Sneaker?;
            return MaterialPageRoute(settings: const RouteSettings(name: '/authenticate'), builder: (context) => ViewAuthenticate(sneaker: sneaker));
          case '/authenticate/result':
            var sneaker = settings.arguments as model.Sneaker;
            return MaterialPageRoute(settings: const RouteSettings(name: '/authenticate/result'), builder: (context) => ViewAuthenticateResult(sneaker: sneaker));
          case '/authenticate/result-binary':
            var success = settings.arguments as bool;
            return MaterialPageRoute(settings: const RouteSettings(name: '/authenticate/result-binary'), builder: (context) => ViewAuthenticateResultBinary(success: success));
          default:
            // by default we return the home page
            return MaterialPageRoute(settings: const RouteSettings(name: '/'), builder: (context) => const ViewHome());
        }
      },
    );
  }
}
