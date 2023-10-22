import 'package:flutter/material.dart';
import 'package:tbcxsui/data.dart';
import 'package:tbcxsui/models/models.dart' as model;
import 'package:tbcxsui/views/app_home/view_authenticate_result.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class ViewAuthenticate extends StatelessWidget {
  const ViewAuthenticate({
    super.key,
    this.sneaker,
  });

  final model.Sneaker? sneaker;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ui.Colors.background,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: ui.kAppBarHeight,
              child: Row(
                children: [
                  ui.CircularButton(
                    icon: Icons.close,
                    tooltip: 'Back',
                    onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.nfc, size: 256.0, color: ui.Colors.gray3),
                      const SizedBox(height: 24.0),
                      if (sneaker == null) ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        child: const Text('Hold you phone near the sole of your shoe to check its authenticity.', style: ui.Text.body, textAlign: TextAlign.center),
                      ),
                      if (sneaker != null) ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              height: 96.0,
                              width: 96.0,
                              decoration: BoxDecoration(
                                color: ui.Colors.gray1,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ui.Colors.border,
                                  width: 1.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(sneaker!.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(sneaker!.name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8.0),
                            Text('Hold you phone near the sole of your ${sneaker!.name} to check their authenticity.', style: ui.Text.body, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: ui.StandardButton(
                      label: 'Authenticate',
                      onTap: () => sneaker == null
                        ? Navigator.pushNamed(context, '/authenticate/result', arguments: dataSneakers.first)
                        : Navigator.pushNamed(context, '/authenticate/result-binary', arguments: true),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
