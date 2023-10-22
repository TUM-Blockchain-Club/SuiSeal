import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;

class Button extends StatefulWidget {
  const Button({
    Key? key,
    required this.content,
    this.onTap,
    this.onLongPress,
    this.disabled = false,
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.border = BorderSide.none,
    this.elevation = 0.0,
    this.scale = true,
    this.hitTestPadding = EdgeInsets.zero,
    this.tooltip,
  }) : super(key: key);

  final bool disabled;
  final Color color;
  final BorderRadius borderRadius;
  final BorderSide border;
  final double elevation;

  // TODO: Implement hitTestPadding
  final EdgeInsets hitTestPadding;

  final String? tooltip;

  /// If true, a scale animation will be triggered when tapping the button
  ///
  /// Only applies to non-android devices
  final bool scale;

  final Widget content;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOut = CurveTween(curve: Curves.linear);
  static final Animatable<double> _scaleTween =
      Tween<double>(begin: 1.0, end: 0.95);
  static final Animatable<double> _opacityTween =
      Tween<double>(begin: 1.0, end: 0.4);

  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scale = _controller.drive(_easeOut.chain(_scaleTween));
    _opacity = _controller.drive(_easeOut.chain(_opacityTween));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAndroidButton({required Widget content}) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Material(
        color: widget.color,
        borderRadius: widget.borderRadius,
        elevation: widget.elevation,
        child: InkWell(
          onTap: widget.onTap?.call,
          onLongPress: widget.onLongPress?.call,
          customBorder: RoundedRectangleBorder(
            borderRadius: widget.borderRadius,
          ),
          child: content,
        ),
      ),
    );
  }

  void _onTap() async {
    if (!widget.disabled) widget.onTap?.call();
    Feedback.forTap(context);
    await _controller.forward();
    await _controller.reverse();
  }

  void _onTapDown(TapDownDetails tapDownDetails) async {
    await _controller.forward();
  }

  void _onTapUp(TapUpDetails tapUpDetails) async {
    await _controller.reverse();
  }

  void _onTapCancel() async {
    await _controller.reverse();
  }

  Widget _buildIosButton({required Widget content}) {
    Widget scaleWrapper({required Widget content}) {
      if (widget.scale) {
        return Transform.scale(
          scale: _scale.value,
          child: content,
        );
      }
      return content;
    }

    return GestureDetector(
      onTap: _onTap,
      onLongPress: widget.onLongPress?.call,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => scaleWrapper(
          content: ClipRRect(
            borderRadius: widget.borderRadius,
            child: Material(
              color: widget.color,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: widget.borderRadius,
                side: widget.border,
              ),
              elevation: widget.elevation,
              child: Opacity(
                opacity: _opacity.value,
                child: child,
              ),
            ),
          ),
        ),
        child: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget result = widget.content;

    if (widget.tooltip != null) {
      result = Tooltip(
        message: widget.tooltip,
        child: result,
      );
    }

    if (kIsWeb) {
      result = _buildIosButton(content: result);
    }
    if (Platform.isAndroid) {
      result = _buildAndroidButton(content: result);
    } else {
      result = _buildIosButton(content: result);
    }

    if (widget.disabled) {
      result = Opacity(
        opacity: 0.5,
        child: result,
      );
    }

    return Semantics(
      button: true,
      enabled: true,
      child: result,
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key? key,
    required this.icon,
    this.color = Colors.white,
    this.label,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String? label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Button(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10.0),
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(icon, color: color, semanticLabel: label),
      ),
      onTap: onTap,
    );
  }
}

class StandardButton extends StatelessWidget {
  const StandardButton({
    Key? key,
    this.label,
    this.tooltip,
    this.icon,
    this.foreground = ui.Colors.textButtonCTA,
    this.background = ui.Colors.buttonCTA,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    this.borderRadius = 24.0,
    this.axis = Axis.horizontal,
    this.onLongPress,
    this.onTap,
  })  : assert(label != null || icon != null),
        assert(onTap != null || onLongPress != null),
        super(key: key);

  final String? label;
  final String? tooltip;
  final IconData? icon;
  final Color foreground;
  final Color background;
  final EdgeInsets padding;
  final double borderRadius;
  final Axis axis;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  Widget _layoutWrapper({Widget? icon, Widget? label}) {
    switch (axis) {
      case Axis.horizontal:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon,
            if (icon != null && label != null) const SizedBox(width: 8.0),
            if (label != null) label,
          ],
        );
      case Axis.vertical:
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon,
              if (icon != null && label != null) const SizedBox(height: 8.0),
              if (label != null) label,
            ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      color: background,
      tooltip: tooltip,
      borderRadius: BorderRadius.circular(borderRadius),
      border: const BorderSide(
        color: ui.Colors.border,
        width: 1.0,
      ),
      content: Padding(
        padding: padding,
        child: _layoutWrapper(
          icon: icon != null ? Icon(icon!, color: foreground) : null,
          label: label != null
              ? Text(label!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: foreground,
                  ))
              : null,
        ),
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.icon,
    this.tooltip,
    required this.onTap,
  });

  final IconData? icon;
  final String? tooltip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Button(
      color: ui.Colors.element,
      borderRadius: BorderRadius.circular(100.0),
      border: const BorderSide(
        color: ui.Colors.border,
        width: 1.0,
      ),
      content: SizedBox(
        width: 42.0,
        height: 42.0,
        child: Center(
          child: Icon(
            icon,
            color: ui.Colors.text,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
