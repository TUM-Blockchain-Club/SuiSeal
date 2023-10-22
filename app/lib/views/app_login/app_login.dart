import 'package:flutter/material.dart';
import 'package:tbcxsui/blocs/blocs.dart';

import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class AppLogin extends StatelessWidget {
  const AppLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuiSeal',
      debugShowCheckedModeBanner: false,
      home: Material(
        color: ui.Colors.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: ui.Colors.gray1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: ui.StandardButton(
                        label: 'Connect Wallet',
                        icon: Icons.wallet,
                        onTap: () => context.read<WalletBloc>().add(WalletConnect()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
