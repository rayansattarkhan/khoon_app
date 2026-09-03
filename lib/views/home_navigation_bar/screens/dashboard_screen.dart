import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/cards/blood_availability_card.dart';
import 'package:khoon_app/core/ui_components/single_bar_chart/single_bar_chart.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, Object>> gridItems = [
    {
      "title": 12,
      "detail": "Open requests",
      "titleColor": MyTextColors.redAccent,
    },
    {
      "title": 48,
      "detail": "Available donors",
      "titleColor": MyTextColors.darkGreen,
    },
    {
      "title": 142,
      "detail": "Saved this month",
      "titleColor": MyTextColors.blueAccent,
    },
    {
      "title": "O+ / A+",
      "detail": "High demand groups",
      "titleColor": MyTextColors.redAccent,
    },
  ];

  var barChartItems = [
    {"title": "A+", "toDisplayValues": 1, "totalValues": 8},
    {"title": "B+", "toDisplayValues": 2, "totalValues": 8},
    {"title": "AB+", "toDisplayValues": 3, "totalValues": 8},
    {"title": "O+", "toDisplayValues": 4, "totalValues": 8},
    {"title": "A-", "toDisplayValues": 5, "totalValues": 8},
    {"title": "B-", "toDisplayValues": 6, "totalValues": 8},
    {"title": "AB-", "toDisplayValues": 7, "totalValues": 8},
    {"title": "O-", "toDisplayValues": 8, "totalValues": 8},
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight / 80),
            BloodAvailabilityCard(
              titleText: DonorAvailability.donorAvailable == true
                  ? "You are marked as AVAILABLE"
                  : "You are marked as UNAVAILABLE",
              infoText: DonorAvailability.donorAvailable == true
                  ? "Donors nearby can see your contact info"
                  : "You cannot donate blood currently",
              width: screenWidth - 20,
              height: 60,
            ),
            SizedBox(height: screenHeight / 40),
            Align(
              alignment: .centerStart,
              child: Text(
                "City Overview & Impact",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: screenHeight / 80),
            SizedBox(
              height: screenHeight / 4.61,
              child: GridView.builder(
                itemCount: gridItems.length,
                shrinkWrap: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, int index) {
                  return Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      border: .all(color: MyColors.lightGrey),
                      borderRadius: .circular(15),
                      color: MyColors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: .spaceEvenly,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          gridItems[index]["title"].toString(),
                          style: Theme.of(context).textTheme.headlineLarge!
                              .copyWith(
                                color: gridItems[index]["titleColor"] as Color,
                              ),
                        ),
                        Text(
                          gridItems[index]["detail"].toString(),
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: MyTextColors.mediumGrey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: .all(10),
              height: screenHeight / 4.5,
              width: screenWidth - 20,
              decoration: BoxDecoration(
                color: MyColors.white,
                border: .all(color: MyColors.lightGrey),
                borderRadius: .circular(15),
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Weekly City Requests Trend",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: MyTextColors.darkGrey, fontSize: 15),
                  ),
                  Text(
                    "Peshawar Region (Past 7 Days)",
                    style: Theme.of(context).textTheme.bodySmall!
                        .copyWith(color: MyTextColors.lightGrey),
                  ),
                  // TODO: Timeline Chart
                ],
              ),
            ),
            SizedBox(height: screenHeight / 40),
            Container(
              padding: .all(10),
              height: screenHeight / 4,
              width: screenWidth - 20,
              decoration: BoxDecoration(
                color: MyColors.white,
                border: .all(color: MyColors.lightGrey),
                borderRadius: .circular(15),
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "City Demand By Blood Group",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: MyTextColors.darkGrey, fontSize: 15),
                  ),
                  Text(
                    "Urgent requests ratio across Peshawar",
                    style: Theme.of(context).textTheme.bodySmall!
                        .copyWith(color: MyTextColors.lightGrey),
                  ),
                  SizedBox(height: screenHeight / 200,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: barChartItems.length,
                      padding: .only(top: 5, bottom: 5),
                      itemBuilder: (context, int index) {
                        return MySingleHorizontalBarChart(
                          width: screenWidth - 20,
                          height: screenHeight / 40,
                          showPercent: true,
                          barPrefixText: barChartItems[index]["title"].toString(),
                          displayValue: barChartItems[index]["toDisplayValues"] as int,
                          totalValues: barChartItems[index]["totalValues"] as int,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight < 1600 ? screenHeight / 200 : screenHeight / 400,),
                  Center(
                    child: Text(
                      "Updated in real-time from Peshawar hospitals",
                      style: Theme.of(context).textTheme.bodySmall!
                          .copyWith(color: MyTextColors.lightGrey),
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
