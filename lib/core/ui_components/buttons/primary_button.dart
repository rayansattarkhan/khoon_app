import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MyPrimaryButton extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final String? fontFamily;
  final double borderRadius;
  final void Function()? onTap;
  final double width;
  final double height;

  const MyPrimaryButton(
    this.text, {
    super.key,
    this.width = double.infinity,
    this.height = 48.0,
    this.fontWeight = .bold,
    this.fontSize = 16.0,
    this.fontFamily,
    this.borderRadius = 8.0,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _MyPrimaryButton();
}

class _MyPrimaryButton extends State<MyPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: MyColors.brightRed,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          // To use any member variable/property from a class extended from a
          // stateful widget class, we can only access it if we use a "widget."
          // before the property.
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: MyTextColors.whiteAccent,
              fontWeight: .bold,
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
