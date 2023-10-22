import 'package:flutter/material.dart';

/// Space an iterable of widgets by a fixed size.
List<Widget> space(double space, Iterable<Widget> list,
    [Axis direction = Axis.horizontal]) {
  switch (direction) {
    case Axis.vertical:
      return separate(SizedBox(height: space), list);
    case Axis.horizontal:
      return separate(SizedBox(width: space), list);
  }
}

/// Place a given widget inbetween each element of an iterable of widgets.
List<Widget> separate(Widget separator, Iterable<Widget> list) {
  return list
      .expand((element) sync* {
        yield separator;
        yield element;
      })
      .skip(1)
      .toList();
}
