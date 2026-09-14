import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/ui_components/cards/blood_request_card.dart';
import 'package:khoon_app/views/requests_screens/post_blood_request_screen.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({super.key});

  @override
  State<RequestBloodScreen> createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: .center,
                child: Text(
                  "Request Blood",
                  style: Theme.of(context).textTheme.headlineSmall!
                      .copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: screenWidth / 40),
              Expanded(
                child: Column(
                  children: [BloodRequestCard(width: screenWidth - 20)],
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
                        builder: (context) => PostBloodRequestScreen(),
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
