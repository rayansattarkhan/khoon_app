import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/ui_components/cards/blood_donation_card.dart';
import 'package:khoon_app/views/requests_screens/post_donation_availability_screen.dart';

class DonateBloodScreen extends StatefulWidget {
  const DonateBloodScreen({super.key});

  @override
  State<DonateBloodScreen> createState() => _DonateBloodScreenState();
}

class _DonateBloodScreenState extends State<DonateBloodScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Donate Blood",
                style: Theme.of(context).textTheme.headlineSmall!
                    .copyWith(fontSize: 24),
              ),
              SizedBox(height: screenWidth / 40),
              Expanded(
                child: Column(
                  children: [BloodDonationCard(width: screenWidth - 20)],
                ),
              ),
              Align(
                alignment: .centerRight,
                child: FloatingActionButton(
                  backgroundColor: MyColors.brightRed,
                  foregroundColor: MyColors.white,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDonationAvailabilityScreen(),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
