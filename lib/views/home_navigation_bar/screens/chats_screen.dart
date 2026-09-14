import 'package:flutter/material.dart';
import 'package:khoon_app/core/ui_components/cards/message_box_card.dart';
import 'package:khoon_app/views/message_threads/message_threads.dart';
import 'package:khoon_app/view_models/constants/blood_groups.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: .start,
      children: [
        Text(
          "Messages and Calls",
          style: Theme.of(context).textTheme.headlineSmall!
              .copyWith(fontSize: 24),
        ),
        SizedBox(height: screenHeight / 40),
        MyMessageBoxCard(
          bloodGroup: BloodGroups.abNegative(),
          width: screenWidth,
          height: screenHeight * 0.11,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyMessageThreads()),
            );
          },
        ),
      ],
    );
  }
}
