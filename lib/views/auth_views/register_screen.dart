import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/primary_button.dart';
import 'package:khoon_app/views/auth_views/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Row(children: [Icon(Icons.arrow_back), Text("Back")]),
                ),
                Text("Create Account"),
              ],
            ),
            Form(
              child: Column(
                children: [
                  Text("Full Name"),
                  TextFormField(),
                  Text("Email Address"),
                  TextFormField(),
                  Text("Phone Number (WhatsApp"),
                  TextFormField(),
                  Row(
                    children: [
                      SizedBox(
                        width: (screenWidth / 2) - 5,
                        child: Column(
                          children: [
                            Text("Blood Group"),
                            // TODO: Drop down menu for blood group
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (screenWidth / 2) - 5,
                        child: Column(
                          children: [
                            Text("City"),
                            // TODO: Drop down menu for blood group
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text("Enter Password"),
                  TextFormField(),
                  Text("Confirm Password"),
                  TextFormField(),
                ],
              ),
            ),
            Container(
              width: screenWidth, // TODO: Subtract screen padding
              height: 48.0,
              decoration: BoxDecoration(
                color: MyColors.lightPink,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Available to donate blood?"),
                      Text("You can turn this off anytime in settings"),
                    ],
                  ),
                  // TODO: Toggle button for availability
                ],
              ),
            ),
            // TODO: Register button
            MyPrimaryButton("Register as Donor"),
            Row(
              children: [
                Text("Already registered?"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("Sign In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
