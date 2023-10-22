import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;
import 'package:tbcxsui/models/models.dart' as model;

class ViewSneakerDetail extends StatelessWidget {
  const ViewSneakerDetail({
    super.key,
    required this.sneaker,
  });

  final model.Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Material(
      color: ui.Colors.background,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16.0, ui.kAppBarHeight + 16.0, 16.0, 112.0) + media.padding,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: ui.Colors.element,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: ui.Colors.border,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(sneaker.imagePath, fit: BoxFit.cover, height: 300.0),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Flexible(
                          child: Text(sneaker.name, style: const TextStyle(color: ui.Colors.text, fontSize: 18.0, fontWeight: FontWeight.w700), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(Icons.verified, color: ui.Colors.positive, size: 16.0),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text('\$${sneaker.price}', style: const TextStyle(color: ui.Colors.text, fontSize: 32.0, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 24.0),
                    Text(sneaker.description, style: const TextStyle(color: ui.Colors.textSecondary, fontSize: 14.0, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: media.padding.top + ui.kAppBarHeight,
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
                  top: media.padding.top,
                  left: 12.0,
                  bottom: 0.0,
                  child: Center(
                    child: ui.CircularButton(
                      icon: Icons.close,
                      tooltip: 'Back',
                      onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 32.0 + media.padding.bottom,
            child: ui.StandardButton(
              label: 'Buy',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
