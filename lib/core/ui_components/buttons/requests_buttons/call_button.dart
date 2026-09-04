import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class CallButton extends StatelessWidget {
  final double width;
  final double height;
  final void Function()? onTap;

  const CallButton({
    super.key,
    this.width = .infinity,
    this.height = 50,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: MyColors.lightPink,
          border: .all(color: MyColors.lightGrey),
          borderRadius: .circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.call, color: MyColors.brightRed),
              SizedBox(width: 4),
              Text(
                "Call",
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(color: MyTextColors.darkGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
