import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';

class MyCircularButton extends StatelessWidget {
  final void Function()? onTap;
  final double width;
  final double height;
  final Color color;
  final double borderWidth;
  final Color borderColor;
  final Widget? child;

  const MyCircularButton({
    super.key,
    this.onTap,
    this.width = 50,
    this.height = 50,
    this.color = MyColors.darkGreen,
    this.borderWidth = 1,
    this.borderColor = MyColors.darkGreen,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: .circle,
          color: color,
          border: .all(
            color: borderColor,
            width: borderWidth,
          )
        ),
        child: Center(child: child),
      ),
    );
  }
}
