import 'package:flutter/material.dart';
import 'package:tbcxsui/models/models.dart' as model;
import 'package:tbcxsui/views/app_home/view_sneaker_detail.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class SneakerCard extends StatelessWidget {
  const SneakerCard({
    super.key,
    required this.sneaker,
  });

  final model.Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    return ui.Button(
      scale: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ui.Colors.border,
                  width: 1.0,
                ),
                image: DecorationImage(
                  image: AssetImage(sneaker.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(24.0),
                color: ui.Colors.element,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sneaker.name, style: const TextStyle(color: ui.Colors.text, fontSize: 14.0, fontWeight: FontWeight.w700), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4.0),
                Text('\$${sneaker.price}', style: const TextStyle(color: ui.Colors.textSecondary, fontSize: 12.0, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
      onTap: () => Navigator.pushNamed(context, '/sneaker', arguments: sneaker),
    );
  }
}
