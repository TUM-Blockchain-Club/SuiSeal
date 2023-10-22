import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;
import 'package:tbcxsui/data.dart';
import 'package:tbcxsui/widgets/sneaker_card.dart';

const _kAppBarHeight = 100.0;

class ViewShop extends StatefulWidget {
  const ViewShop({super.key});

  @override
  State<ViewShop> createState() => _ViewShopState();
}

class _ViewShopState extends State<ViewShop> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Stack(
      children: [
        GridView.extent(
          padding: const EdgeInsets.fromLTRB(16.0, _kAppBarHeight + 16.0, 16.0, 96.0) + media.padding,
          maxCrossAxisExtent: 200.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 2/3,
          children: [
            for (var sneaker in dataSneakers) SneakerCard(sneaker: sneaker),
          ],
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          height: media.padding.top + _kAppBarHeight,
          child: Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 24.0, sigmaY: 24.0),
                  child: Container(
                    color: ui.Colors.background.withOpacity(0.2),
                  ),
                ),
              ),
              Positioned(
                top: media.padding.top + 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
                child: ui.TextField(
                  controller: _searchController,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
