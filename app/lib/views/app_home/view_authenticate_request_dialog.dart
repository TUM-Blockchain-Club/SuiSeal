import 'package:flutter/material.dart';
import 'package:tbcxsui/views/app_home/view_authenticate.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;
import 'package:tbcxsui/models/models.dart' as model;

class ViewAuthenticateRequestDialog extends StatelessWidget {
  const ViewAuthenticateRequestDialog({
    super.key,
    required this.sneaker,
  });

  final model.Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    return ui.Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('New Buyer', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16.0),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Image.asset(sneaker.imagePath, height: 256.0, width: 256.0, fit: BoxFit.cover),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(sneaker.name, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('\$${sneaker.price}', style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24.0),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: ui.StandardButton(
                    label: 'Authenticate',
                    borderRadius: 100.0,
                    onTap: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                      Navigator.pushNamed(context, '/authenticate', arguments: sneaker);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
