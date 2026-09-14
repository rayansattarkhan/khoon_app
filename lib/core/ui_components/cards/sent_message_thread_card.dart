import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MySentMessageThreadCard extends StatefulWidget {
  final String messageText;
  final String timeSent;

  const MySentMessageThreadCard({
    super.key,
    required this.messageText,
    required this.timeSent,
  });

  @override
  State<MySentMessageThreadCard> createState() =>
      _MySentMessageThreadCardState();
}

class _MySentMessageThreadCardState extends State<MySentMessageThreadCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: .centerRight,
      child: Container(
        width: screenWidth / 1.2 - 10,
        padding: .all(10),
        margin: .only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: MyColors.lightPink,
          borderRadius: .only(
            topLeft: .circular(15),
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
            Align(alignment: .bottomRight, child: Text(widget.timeSent)),
          ],
        ),
      ),
    );
  }
}
