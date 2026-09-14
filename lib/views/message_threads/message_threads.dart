import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/circular_button.dart';
import 'package:khoon_app/core/ui_components/cards/received_message_thread_card.dart';
import 'package:khoon_app/core/ui_components/cards/sent_message_thread_card.dart';
import 'package:khoon_app/view_models/constants/blood_groups.dart';

class MyMessageThreads extends StatefulWidget {
  const MyMessageThreads({super.key});

  @override
  State<MyMessageThreads> createState() => _MyMessageThreadsState();
}

class _MyMessageThreadsState extends State<MyMessageThreads> {
  List<Map<String, dynamic>> messages = [
    {
      "nature": "received",
      "time": "11:40 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:42 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:43 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "received",
      "time": "11:45 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:47 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "sent",
      "time": "11:48 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:49 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:40 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:42 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:43 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "received",
      "time": "11:45 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:47 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "sent",
      "time": "11:48 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:49 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:40 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:42 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:43 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "received",
      "time": "11:45 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:47 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "sent",
      "time": "11:48 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:49 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:40 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:42 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:43 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "received",
      "time": "11:45 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "sent",
      "time": "11:47 am",
      "text": "this is a test placeholder text message that is to be received by another user.",
    },
    {
      "nature": "sent",
      "time": "11:48 am",
      "text": "this is a test placeholder text message that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another userthis is a test placeholder textmessage that is to be sent by another user.",
    },
    {
      "nature": "received",
      "time": "11:49 am",
      "text": "this is a test placeholder text message that is to be sent by another user.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight > 1400
                  ? screenHeight * 0.10
                  : screenHeight * 0.09,
              decoration: BoxDecoration(color: MyColors.white),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight > 1400
                        ? screenHeight * 0.025
                        : screenHeight * 0.015,
                    left: 4,
                    child: Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: MyColors.brightRed,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        CircleAvatar(
                          radius: 26,
                          child: Text(
                            BloodGroups.abNegative().toString(),
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(color: MyColors.brightRed),
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: Text(
                            "Lady Reading Hospital - Ward 3",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontSize: 16),
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: screenHeight > 1400
                        ? screenHeight * 0.025
                        : screenHeight * 0.015,
                    right: 10,
                    child: MyCircularButton(
                      onTap: () {
                        debugPrint("call button tapped");
                      },
                      color: MyColors.lightGreen,
                      borderWidth: 2,
                      child: Icon(Icons.call, color: MyColors.darkGreen),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth - 20,
              height: screenHeight - (screenHeight * 0.10 + 35),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return messages[index]["nature"] == "sent"
                            ? MySentMessageThreadCard(
                                messageText: messages[index]["text"],
                                timeSent: messages[index]["time"],
                              )
                            : MyReceivedMessageThreadCard(
                                messageText: messages[index]["text"],
                                timeReceived: messages[index]["time"],
                              );
                      },
                    ),
                  ),
                  SizedBox(
                    width: screenWidth - 20,
                    height: screenHeight * 0.12,
                    child: Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Container(
                          width: screenWidth * 0.75,
                          height: screenHeight / 15,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            border: .all(color: MyColors.lightGrey),
                            borderRadius: .circular(30),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: .only(left: 15, top: 10),
                                width: screenWidth * 0.44,
                                child: TextField(
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    enabledBorder: .none,
                                    focusedBorder: .none,
                                    hintText: "Type your message...",
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth / 20),
                              GestureDetector(
                                onTap: () {
                                  debugPrint("attach button tapped");
                                },
                                child: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Icon(Icons.attach_file),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  debugPrint("camera button tapped");
                                },
                                child: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Icon(Icons.photo_camera),
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyCircularButton(
                          onTap: () {
                            debugPrint("send message button tapped");
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: MyColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
