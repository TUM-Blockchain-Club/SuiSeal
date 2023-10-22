import 'package:flutter/material.dart';
import 'package:tbcxsui/widgets/ui/ui.dart' as ui;
import 'package:tbcxsui/utils/utils.dart' as utils;

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({
    super.key,
    this.initialIndex = 0,
    required this.items,
    required this.onTap,
  });

  final int initialIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
    widget.items[index].onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: ui.Colors.element,
        border: Border.all(
          width: 1.0,
          style: BorderStyle.solid,
          color: ui.Colors.border,
        ),
        borderRadius: BorderRadius.circular(54.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 4.0),
            blurRadius: 32.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 4.0),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: utils.space(4.0, widget.items.map((item) {
          bool isSelected = widget.items.indexOf(item) == _selectedIndex;
          return ui.Button(
            color: isSelected ? ui.Colors.background : ui.Colors.element,
            borderRadius: BorderRadius.circular(24.0),
            content: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(isSelected ? item.activeIcon : item.icon),
            ),
            onTap: () => _onTap(widget.items.indexOf(item)),
          );
        }).toList()),
      ),
    );
  }
}

class BottomNavigationBarItem {
  const BottomNavigationBarItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final VoidCallback onTap;
}
