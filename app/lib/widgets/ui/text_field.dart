import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/material.dart' as material show TextField;
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class TextField extends StatelessWidget {
  const TextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return material.TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ui.Colors.element,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: ui.Colors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: ui.Colors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: ui.Colors.border,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: ui.Colors.border,
          ),
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: ui.Colors.textSecondary,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      ),
      maxLines: 1,
      style: const TextStyle(
        color: ui.Colors.text,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
