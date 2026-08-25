import 'package:flutter/material.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';

class BloodAvailabilityCard extends StatelessWidget {
  final String titleText;
  final String infoText;
  final double width;
  final double height;
  final double? borderRadius;
  final double borderWidth;

  // Constant constructor.
  const BloodAvailabilityCard({
    super.key,
    required this.titleText,
    this.infoText = "",
    this.width = 90,
    this.height = 30,
    this.borderRadius = 15.0,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: DonorAvailability.donorAvailable == true
            ? BloodDonationAvailabilityCardsColors.fillGreen
            : BloodDonationAvailabilityCardsColors.fillYellow,
        border: .all(
          color: DonorAvailability.donorAvailable == true
              ? BloodDonationAvailabilityCardsColors.borderGreen
              : BloodDonationAvailabilityCardsColors.borderYellow,
          width: borderWidth,
        ),
        borderRadius: .circular(borderRadius!),
      ),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: .circle,
              color: DonorAvailability.donorAvailable == true
                  ? BloodDonationAvailabilityCardsColors.statusGreen
                  : BloodDonationAvailabilityCardsColors.statusYellow,
            ),
          ),
          Column(
            mainAxisAlignment: .spaceEvenly,
            crossAxisAlignment: .start,
            children: [
              Text(
                titleText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .bold,
                  color: DonorAvailability.donorAvailable == true
                      ? BloodDonationAvailabilityCardsColors.titleGreen
                      : BloodDonationAvailabilityCardsColors.titleYellow,
                ),
              ),
              Text(
                infoText,
                style: TextStyle(
                  fontSize: 13,
                  color: DonorAvailability.donorAvailable == true
                      ? BloodDonationAvailabilityCardsColors.infoGreen
                      : BloodDonationAvailabilityCardsColors.infoYellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
