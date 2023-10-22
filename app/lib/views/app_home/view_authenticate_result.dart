import 'package:flutter/material.dart';
import 'package:tbcxsui/models/models.dart' as model;
import 'package:tbcxsui/views/app_home/view_authenticate.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class ViewAuthenticateResult extends StatelessWidget {
  const ViewAuthenticateResult({
    super.key,
    required this.sneaker,
  });

  final model.Sneaker sneaker;

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
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: ui.Colors.element,
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: ui.Colors.border,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Scan Result', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700)),
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
                        Text(sneaker.name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16.0),
                        const Text('0x9dd25061ed5445f622de32727efa3a47a405edbc92e6461b17802237b8782e48', style: ui.Text.bodySecondary),
                      ],
                    ),
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
                      label: 'Scan Another',
                      onTap: () {
                        Navigator.pop(context);
                      },
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

class ViewAuthenticateResultBinary extends StatelessWidget {
  const ViewAuthenticateResultBinary({
    super.key,
    required this.success,
  });

  final bool success;

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
                      success
                        ? const Icon(Icons.check_circle_outline, size: 128.0, color: ui.Colors.positive)
                        : const Icon(Icons.cancel_outlined, size: 128.0, color: ui.Colors.negative),
                      const SizedBox(height: 24.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        child: Text(success ? 'Authentication Successful' : 'Authentication Failed', style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
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
                      label: success ? 'Done' : 'Try Again',
                      onTap: () => success
                        ? Navigator.popUntil(context, ModalRoute.withName('/'))
                        : Navigator.pop(context),
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
