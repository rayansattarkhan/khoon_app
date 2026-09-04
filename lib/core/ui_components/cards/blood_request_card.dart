import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/requests_buttons/call_button.dart';
import 'package:khoon_app/core/ui_components/buttons/requests_buttons/chat_button.dart';

class BloodRequestCard extends StatefulWidget {
  final double width;
  const BloodRequestCard({super.key, required this.width});

  @override
  State<BloodRequestCard> createState() => _BloodRequestCardState();
}

class _BloodRequestCardState extends State<BloodRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 220,
      padding: .all(15),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: .circular(15),
        border: .all(color: MyColors.lightGrey),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: MyColors.lightPink,
                borderRadius: .circular(6),
              ),
              child: Center(
                child: Text(
                  "A+",
                  style: Theme.of(context).textTheme.headlineMedium!
                      .copyWith(color: MyTextColors.redAccent),
                ),
              ),
            ),
          ),
          Positioned(
            left: 75,
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: MyColors.lightPink,
                borderRadius: .circular(10),
              ),
              child: Center(
                child: Text(
                  "Critical",
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: MyTextColors.redAccent),
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 75,
            child: Text(
              "Lady Reading Hospital",
              style: Theme.of(context).textTheme.headlineSmall!
                  .copyWith(fontSize: 22),
            ),
          ),
          Positioned(
            right: 0,
            child: Text(
              "12 mins ago",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Positioned(
            top: 75,
            child: Text(
              "Patient: Patient_1 \u{2022} Ward 3, Bed 12",
              style: Theme.of(context).textTheme.bodyLarge!
                  .copyWith(color: MyTextColors.semiDarkGrey),
            ),
          ),
          Positioned(
            top: 95,
            child: Row(
              spacing: 5,
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Text(
                  "Required: ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text("2 Bags", style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  "\u{2022} Peshawar City",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            child: Container(
              width: widget.width,
              height: 1,
              decoration: BoxDecoration(
                border: .all(color: MyColors.lightGrey),
              ),
              child: Text(""),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: .center,
              children: [
                ChatButton(width: widget.width / 2 - 24, onTap: () {}),
                SizedBox(width: 16),
                CallButton(width: widget.width / 2 - 24, onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
