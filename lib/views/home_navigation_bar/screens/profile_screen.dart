import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/outlined_button.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';
import 'package:khoon_app/views/auth_views/sign_in_screen.dart';

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
                style: Theme.of(context).textTheme.headlineLarge,
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
            padding: .all(10),
            height: screenHeight / 6,
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: .circular(15),
              border: .all(color: MyColors.lightGrey),
            ),
            child: Row(
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
                SizedBox(width: screenWidth / 20),
                Column(
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
                Spacer(),
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
            width: .infinity,
            height: screenHeight / 7,
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
                        Text(
                          "Available to Donate",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: MyTextColors.blackAccent,
                                fontSize: 14,
                              ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: .circle,
                                color: DonorAvailability.donorAvailable
                                    ? MyColors.darkGreen
                                    : BloodDonationAvailabilityCardsColors
                                          .statusYellow,
                              ),
                            ),
                            SizedBox(width: screenWidth / 80),
                            Text(
                              DonorAvailability.donorAvailable
                                  ? "Active in Search Results"
                                  : "Inactive in Search Results",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: DonorAvailability.donorAvailable
                                        ? MyTextColors.darkGreen
                                        : BloodDonationAvailabilityCardsColors
                                              .infoYellow,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Switch(
                      activeThumbColor: MyColors.white,
                      activeTrackColor: MyColors.darkGreen,
                      inactiveTrackColor: MyColors.lightGrey,
                      inactiveThumbColor: MyColors.mediumGrey,
                      trackOutlineColor: .resolveWith(((states) {
                        return states.contains(WidgetState.selected)
                            ? MyColors.darkGreen
                            : MyColors.mediumGrey;
                      })),
                      value: DonorAvailability.donorAvailable,
                      onChanged: (value) {
                        setState(() {
                          DonorAvailability.donorAvailable = value;
                        });
                      },
                    ),
                  ],
                ),
                Divider(color: MyColors.lightGrey),
                Row(
                  children: [
                    Text("Last Donated: "),
                    SizedBox(width: screenWidth / 200),
                    Text(
                      "10 June, 2026",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: .bold,
                        color: MyTextColors.blackAccent,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: screenWidth / 200),
                    Text("(60+ days ago)"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 40),
          Container(
            width: .infinity,
            height: screenHeight / 3.5,
            padding: .all(10),
            decoration: BoxDecoration(
              color: MyColors.white,
              border: .all(color: MyColors.lightGrey),
              borderRadius: .circular(15),
            ),
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "Change City/Region",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyTextColors.darkGrey,
                          fontWeight: .normal,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: MyColors.semiDarkGrey),
                    ],
                  ),
                ),
                Divider(color: MyColors.lightGrey),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "Update last donation date",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyTextColors.darkGrey,
                          fontWeight: .normal,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: MyColors.semiDarkGrey),
                    ],
                  ),
                ),
                Divider(color: MyColors.lightGrey),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "My active blood requests",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyTextColors.darkGrey,
                          fontWeight: .normal,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: MyColors.semiDarkGrey),
                    ],
                  ),
                ),
                Divider(color: MyColors.lightGrey),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "About Khoon App",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyTextColors.darkGrey,
                          fontWeight: .normal,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: MyColors.semiDarkGrey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 40),
          MyOutlinedButton(
            "Log Out",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
