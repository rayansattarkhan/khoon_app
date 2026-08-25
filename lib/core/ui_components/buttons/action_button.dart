import 'package:flutter/material.dart';

class ActionButton {
  Widget actionButton(String text, Color color, Border? border, BorderRadius? borderRadius) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
