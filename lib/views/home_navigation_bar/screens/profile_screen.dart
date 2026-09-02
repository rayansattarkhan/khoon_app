import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/action_button.dart';
import 'package:khoon_app/views/auth_views/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenHeight / 35),
          Row(
            crossAxisAlignment: .end,
            children: [
              SizedBox(width: screenWidth / 2.8),
              Text(
                "My Profile",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(width: screenWidth / 5),
              Text(
                "Edit",
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(color: MyTextColors.redAccent),
              ),
            ],
          ),
          SizedBox(height: screenHeight / 40),
          Container(
            padding: .all(20),
            height: screenHeight / 6.5,
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: .circular(15),
              border: .all(color: MyColors.lightGrey),
            ),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.lightPink,
                  radius: 50,
                  child: Text(
                    "A",
                    style: Theme.of(context).textTheme.headlineLarge!
                        .copyWith(color: MyTextColors.redAccent),
                  ),
                ),
                SizedBox(width: screenWidth / 30),
                Column(
                  // mainAxisAlignment: .space,
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Ali Khan",
                      style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(fontWeight: .bold, fontSize: 19),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "+92 300 1234567",
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: MyTextColors.mediumGrey),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Peshawar, Pakistan",
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: MyTextColors.mediumGrey),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth / 30),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: MyColors.brightRed,
                    borderRadius: .circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "A+",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: MyColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 40),
          Container(
            padding: .all(10),
            height: screenHeight / 8,
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: .circular(15),
              border: .all(color: MyColors.lightGrey),
            ),
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Available to Donate"),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: .circle,
                                color: MyColors.darkGreen,
                              ),
                            ),
                            SizedBox(width: screenWidth / 80),
                            Text(
                              "Active in Search Results",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: MyTextColors.lightGreen),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Switch(
                      activeTrackColor: MyColors.darkGreen,
                      value: true,
                      onChanged: (onChanged) {},
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text("Last Donated: "),
                    SizedBox(width: screenWidth / 200),
                    Text(
                      "10 June, 2026",
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontWeight: .bold),
                    ),
                    SizedBox(width: screenWidth / 200),
                    Text("(60+ days ago)"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 40),
          MyActionButton(
            "Log Out",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
