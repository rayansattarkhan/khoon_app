import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/view_models/constants/blood_groups.dart';

class MyMessageBoxCard extends StatefulWidget {
  final double? width;
  final double height;
  final BloodGroups bloodGroup;
  final void Function()? onTap;

  const MyMessageBoxCard({
    super.key,
    required this.bloodGroup,
    this.width,
    this.height = 90,
    this.onTap,
  });

  @override
  State<MyMessageBoxCard> createState() => _MyMessageBoxCardState();
}

class _MyMessageBoxCardState extends State<MyMessageBoxCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: .all(10),
        height: widget.height,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: .circular(15),
          border: .all(color: MyColors.lightGrey),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Center(
                    child: Text(
                      widget.bloodGroup.toString(),
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: MyTextColors.redAccent),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    padding: .all(3),
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: MyColors.white,
                    ),
                    child: CircleAvatar(
                      backgroundColor: MyColors.darkGreen,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: widget.width! * 0.5,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Khyber Teaching Hospital",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                  ),
                  Text(
                    "Please come to the Emergency Ward 3, at Khyber Teaching Hospital.",
                    softWrap: true,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widget.width! > 500 ? widget.width! * 0.15 : widget.width! * 0.2,
              child: Column(
                crossAxisAlignment: .end,
                children: [Text("Yesterday")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
