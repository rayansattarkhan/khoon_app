import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';

class MySnackBar {
  static SnackBar show({
    required BuildContext context,
    required String message,
    IconData iconData = Icons.warning_amber,
    Color iconColor = BloodDonationAvailabilityCardsColors.titleYellow,
    Color messageColor = MyColors.brightRed,
    Color backgroundColor = BloodDonationAvailabilityCardsColors.borderYellow,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    return SnackBar(
      behavior: behavior,
      backgroundColor: backgroundColor,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: messageColor),
            ),
          ),
        ],
      ),
    );
  }
}
