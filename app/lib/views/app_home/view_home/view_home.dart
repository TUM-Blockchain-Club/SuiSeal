import 'package:flutter/material.dart' hide BottomNavigationBar, BottomNavigationBarItem;
import 'package:tbcxsui/data.dart';
import 'package:tbcxsui/views/app_home/view_authenticate_request_dialog.dart';
import 'package:tbcxsui/views/app_home/view_home/view_shop.dart';
import 'package:tbcxsui/widgets/bottom_navigation_bar.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  int _currentIndex = 0;

  void _onSelect(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildContent() {
    switch (_currentIndex) {
      case 0:
        return const ViewShop(key: ValueKey('shop'));
      case 1:
        return const ViewShop(key: ValueKey('sale'));
      case 2:
        return const ViewShop(key: ValueKey('profile'));
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Material(
      color: ui.Colors.background,
      child: Stack(
        children: [
          _buildContent(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.0 + media.padding.bottom),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        label: 'Shop',
                        icon: Icons.explore_outlined,
                        activeIcon: Icons.explore,
                        onTap: () {},
                      ),
                      BottomNavigationBarItem(
                        label: 'Search',
                        icon: Icons.sell_outlined,
                        activeIcon: Icons.sell,
                        onTap: () {
                          showDialog(context: context, builder: (context) => ViewAuthenticateRequestDialog(sneaker: dataSneakers.first));
                        },
                      ),
                      BottomNavigationBarItem(
                        label: 'Profile',
                        icon: Icons.account_circle_outlined,
                        activeIcon: Icons.account_circle,
                        onTap: () {},
                      ),
                    ],
                    onTap: _onSelect,
                  ),
                  const SizedBox(width: 12.0),
                  ui.Button(
                    color: ui.Colors.buttonCTA,
                    borderRadius: BorderRadius.circular(54.0),
                    content: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Icon(Icons.center_focus_strong_outlined, color: ui.Colors.textButtonCTA),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/authenticate'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
