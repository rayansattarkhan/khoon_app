import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/action_button.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';

class PostDonationAvailabilityScreen extends StatefulWidget {
  const PostDonationAvailabilityScreen({super.key});

  @override
  State<PostDonationAvailabilityScreen> createState() =>
      _PostDonationAvailabilityScreenState();
}

class _PostDonationAvailabilityScreenState
    extends State<PostDonationAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Text(
                    "Post Donation Availability",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: screenHeight / 60),
                Text(
                  "Availability Duration",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.white,
                    hintText: "E.g.: 2 Days",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightGrey),
                      borderRadius: .circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightGrey),
                      borderRadius: .circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 60),
                Text("City", style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.white,
                    hintText: "E.g.: Peshawar",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightGrey),
                      borderRadius: .circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightGrey),
                      borderRadius: .circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 60),
                Text(
                  "Additional Details / Restriction",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.white,
                    hintText: "E.g.: Only for children in emergency...",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightGrey),
                      borderRadius: .circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightGrey),
                      borderRadius: .circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight / 60),
                MyActionButton("Update Availability Status"),
                SizedBox(height: screenHeight / 60),
                Container(
                  padding: .all(10),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: .circular(8),
                    border: .all(color: MyColors.lightGrey),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Available to donate",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: .circle,
                                      color: DonorAvailability.donorAvailable
                                          ? BloodDonationAvailabilityCardsColors
                                                .statusGreen
                                          : BloodDonationAvailabilityCardsColors
                                                .statusYellow,
                                    ),
                                    child: Text(""),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    DonorAvailability.donorAvailable
                                        ? "Active in search results"
                                        : "Inactive in search results",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color:
                                              DonorAvailability.donorAvailable
                                              ? BloodDonationAvailabilityCardsColors
                                                    .infoGreen
                                              : BloodDonationAvailabilityCardsColors
                                                    .infoYellow,
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
                            inactiveThumbColor: MyColors.mediumGrey,
                            inactiveTrackColor: MyColors.lightGrey,
                            value: DonorAvailability.donorAvailable,
                            trackOutlineColor: .resolveWith(((states) {
                              return states.contains(WidgetState.selected)
                                  ? MyColors.darkGreen
                                  : MyColors.mediumGrey;
                            })),
                            onChanged: (value) {
                              setState(() {
                                DonorAvailability.donorAvailable = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        "This option can be changed in user profile",
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(color: MyTextColors.mediumGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
