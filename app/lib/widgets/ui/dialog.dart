import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter/material.dart' as material show Dialog;
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class Dialog extends StatelessWidget {
  const Dialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return material.Dialog(
      backgroundColor: ui.Colors.element,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      elevation: 16.0,
      child: child,
    );
  }
}
