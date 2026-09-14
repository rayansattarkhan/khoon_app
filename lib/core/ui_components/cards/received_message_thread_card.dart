import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MyReceivedMessageThreadCard extends StatefulWidget {
  final String messageText;
  final String timeReceived;

  const MyReceivedMessageThreadCard({
    super.key,
    required this.messageText,
    required this.timeReceived,
  });

  @override
  State<MyReceivedMessageThreadCard> createState() =>
      _MyReceivedMessageThreadCardState();
}

class _MyReceivedMessageThreadCardState
    extends State<MyReceivedMessageThreadCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: .centerLeft,
      child: Container(
        width: screenWidth / 1.2 - 10,
        padding: .all(10),
        margin: .only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: .only(
            topRight: .circular(15),
            bottomLeft: .circular(15),
            bottomRight: .circular(15),
          ),
          border: .all(color: MyColors.lightGrey),
        ),
        child: Column(
          children: [
            Text(
              widget.messageText,
              style: Theme.of(context).textTheme.bodyLarge!
                  .copyWith(color: MyTextColors.darkGrey, fontSize: 16),
              softWrap: true,
              maxLines: 100,
            ),
            Align(
              alignment: .bottomRight,
              child: Text(
                widget.timeReceived,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
