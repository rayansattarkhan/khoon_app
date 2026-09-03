import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/cards/blood_availability_card.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';
import 'package:khoon_app/views/requests_screens/donate_blood_screen.dart';
import 'package:khoon_app/views/requests_screens/request_blood_screen.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight / 80),
        BloodAvailabilityCard(
          titleText: DonorAvailability.donorAvailable == true
              ? "You are marked as AVAILABLE"
              : "You are marked as UNAVAILABLE",
          infoText: DonorAvailability.donorAvailable == true
              ? "Donors nearby can see your contact info"
              : "You cannot donate blood currently",
          width: MediaQuery.of(context).size.width - 20,
          height: 60,
        ),
        SizedBox(height: screenHeight / 40),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestBloodScreen()),
            );
          },
          child: Container(
            width: .infinity,
            height: screenHeight / 6,
            padding: .all(15),
            decoration: BoxDecoration(
              color: MyColors.brightRed,
              borderRadius: .circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: .only(right: 15),
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: MyColors.lightRed,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/request_screen_images/request_blood.png",
                      scale: 2,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Text(
                        "Request Blood",
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: MyTextColors.whiteAccent),
                      ),
                      Text(
                        "Post an urgent request for a patient or hospital directly in your city",
                        softWrap: true,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyTextColors.pinkAccent,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 10,
                  child: Center(
                    child: Icon(Icons.chevron_right, color: MyColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 40),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DonateBloodScreen()),
            );
          },
          child: Container(
            width: .infinity,
            height: screenHeight / 6,
            padding: .all(15),
            decoration: BoxDecoration(
              color: MyColors.white,
              border: .all(color: MyColors.brightRed, width: 1),
              borderRadius: .circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: .only(right: 15),
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: MyColors.lightPink,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/request_screen_images/donate_blood.png",
                      scale: 2,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Text(
                        "Donate Blood",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      Text(
                        "Browse urgent local requests and contact receivers directly via call or message",
                        softWrap: true,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyTextColors.mediumGrey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 10,
                  child: Center(
                    child: Icon(Icons.chevron_right, color: MyColors.brightRed),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight / 40),
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Active Emergency Overview",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: screenHeight / 80),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: screenWidth / 2 - 15,
              height: screenHeight / 8,
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: .circular(15),
                border: .all(color: MyColors.lightGrey),
              ),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "12",
                    style: Theme.of(context).textTheme.headlineMedium!
                        .copyWith(color: MyTextColors.redAccent),
                  ),
                  Text(
                    "Open requests in city",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: MyTextColors.mediumGrey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.all(15),
              width: screenWidth / 2 - 15,
              height: screenHeight / 8,
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: .circular(15),
                border: .all(color: MyColors.lightGrey),
              ),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "48",
                    style: Theme.of(context).textTheme.headlineMedium!
                        .copyWith(color: MyTextColors.darkGreen),
                  ),
                  Text(
                    "Available donors",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: MyTextColors.mediumGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
