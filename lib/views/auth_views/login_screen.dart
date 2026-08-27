import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/primary_button.dart';
import 'package:khoon_app/views/auth_views/register_screen.dart';
import 'package:khoon_app/views/home_navigation_bar/home_navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  void dispose() {
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.semiWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Image.asset(
                    "assets/images/splash_screen_logo/khoon_app_splash_screen_logo.png",
                    scale: 8,
                  ),
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Sign In to mobilize and save lives",
                    style: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(color: MyColors.semiDarkGrey),
                  ),
                  SizedBox(height: 50),
                  Align(alignment: .centerStart, child: Text("Email Address")),
                  SizedBox(height: 8),
                  TextField(
                    controller: userEmail,
                    keyboardType: .emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.white,
                      hintText: "donor@example.com",
                      hintStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: MyTextColors.lightGrey),
                      prefixIcon: Icon(Icons.email, color: MyColors.mediumGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: MyColors.lightGrey,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: MyColors.lightGrey,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Align(alignment: .centerStart, child: Text("Password")),
                  SizedBox(height: 8),
                  TextField(
                    controller: userPassword,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.white,
                      // focusColor: MyColors.white,
                      hintText: "Password",
                      hintStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: MyTextColors.lightGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: MyColors.lightGrey,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: MyColors.lightGrey,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock, color: MyColors.mediumGrey),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (obscurePassword == true) {
                            obscurePassword = false;
                          } else {
                            obscurePassword = true;
                          }
                          setState(() {});
                        },
                        child: Icon(
                          obscurePassword == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: MyColors.mediumGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: .centerEnd,
                    child: Text(
                      "Forgot Password",
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: MyTextColors.redAccent),
                    ),
                  ),
                  SizedBox(height: 16),
                  // TODO: Sign in button
                  MyPrimaryButton(
                    "Sign In",
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeNavigationBar(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 4),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: MyTextColors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
