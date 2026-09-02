import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MyOutlinedButton extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final String? fontFamily;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final double width;
  final double height;
  final void Function()? onTap;

  const MyOutlinedButton(
    this.text, {
    super.key,
    this.width = double.infinity,
    this.height = 48.0,
    this.fontWeight = .bold,
    this.fontSize = 16.0,
    this.fontFamily,
    this.borderRadius = 8.0,
    this.borderWidth = 2.0,
    this.borderColor = MyColors.brightRed,
    this.onTap,
  });

  @override
  State<MyOutlinedButton> createState() => _MyOutlinedButtonState();
}

class _MyOutlinedButtonState extends State<MyOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: MyColors.white,
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: MyTextColors.redAccent,
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
