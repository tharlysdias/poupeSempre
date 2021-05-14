import 'package:flutter/material.dart';

class Layout {
  static Widget render(Widget content, [String title = "Poupe Sempre"]) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }

  Color primary([double opacity = 1]) => Colors.red[700].withOpacity(opacity);

  Color secondy([double opacity = 1]) => Color(0xc2c03e).withOpacity(opacity);
}
