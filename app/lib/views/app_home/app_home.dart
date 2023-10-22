import 'package:flutter/material.dart' hide BottomNavigationBar, BottomNavigationBarItem;
import 'package:tbcxsui/blocs/blocs.dart';
import 'package:tbcxsui/repositories/repositories.dart';
import 'package:tbcxsui/views/app_home/view_authenticate.dart';
import 'package:tbcxsui/views/app_home/view_authenticate_result.dart';
import 'package:tbcxsui/views/app_home/view_home/view_home.dart';
import 'package:tbcxsui/views/app_home/view_sneaker_detail.dart';
import 'package:tbcxsui/models/models.dart' as model;
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late SuisealRepository _suisealRepository;

  @override
  void initState() {
    super.initState();
    final walletRepository = context.read<WalletRepository>();
    _suisealRepository = SuisealRepository(
      packageId: '0xfe82ed32ad1f1a460ac9c71b46dc66d711efd10b4107333a11c829f0e9d56e73',      
      client: walletRepository.client,
    );

    // _suisealRepository.purchase();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SuisealRepository>(
          create: (context) => _suisealRepository,
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
