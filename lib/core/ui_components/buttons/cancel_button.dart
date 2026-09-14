import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';

class MyCancelButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function()? onTap;

  const MyCancelButton(
    this.text, {
    super.key,
    this.width = .infinity,
    this.height = 40,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: MyColors.babyBlue,
          border: .all(
            color: MyColors.babyBlue,
          ),
          borderRadius: .circular(8),
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            color: MyColors.white,
            fontWeight: .bold,
            fontSize: 16
          ),),
        ),
      ),
    );
  }
}
