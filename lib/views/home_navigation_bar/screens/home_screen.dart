import 'package:flutter/material.dart';
import 'package:khoon_app/core/ui_components/cards/blood_availability_card.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
