import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MyActionButton extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final String? fontFamily;
  final double width;
  final double height;
  final double borderRadius;
  final void Function()? onTap;

  const MyActionButton(
    this.text, {
    super.key,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius = 8,
    this.fontWeight = .bold,
    this.fontSize = 16.0,
    this.fontFamily,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _MyActionButton();
}

class _MyActionButton extends State<MyActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: MyTextColors.whiteAccent,
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
