import 'package:flutter/material.dart';
import 'package:khoon_app/core/ui_components/cards/blood_donation_card.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [BloodDonationCard(width: screenWidth - 20)],
            ),
          ),
        ),
      ),
    );
  }
}
