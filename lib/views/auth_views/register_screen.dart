import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/primary_button.dart';
import 'package:khoon_app/view_models/constants/blood_groups.dart';
import 'package:khoon_app/view_models/donor_availability/donor_availability.dart';
import 'package:khoon_app/views/auth_views/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userFullName = TextEditingController();
  TextEditingController userEmailAddress = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userConfirmPassword = TextEditingController();
  TextEditingController userBloodGroup = TextEditingController();
  TextEditingController userCity = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    userFullName.dispose();
    userEmailAddress.dispose();
    userPhoneNumber.dispose();
    userPassword.dispose();
    userConfirmPassword.dispose();
    userBloodGroup.dispose();
    userCity.dispose();
    super.dispose();
  }

  List<Map<String, Object>> bloodGroups = [
    {"label": "A+", "type": BloodGroup.aPositive()},
    {"label": "B+", "type": BloodGroup.bPositive()},
    {"label": "AB+", "type": BloodGroup.abPositive()},
    {"label": "O+", "type": BloodGroup.oPositive()},
    {"label": "A-", "type": BloodGroup.aNegative()},
    {"label": "B-", "type": BloodGroup.bNegative()},
    {"label": "AB-", "type": BloodGroup.abNegative()},
    {"label": "O-", "type": BloodGroup.oNegative()},
  ];

  List<Map<String, String>> cities = [
    {"cityName": "Thana"},
    {"cityName": "Alladand"},
    {"cityName": "Batkhela"},
    {"cityName": "Malakand"},
    {"cityName": "Palai"},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: Implement ScaffoldMessengers

    return Scaffold(
      backgroundColor: MyColors.semiWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: screenHeight / 100),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, color: MyColors.brightRed),
                          Text(
                            "Back",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(color: MyTextColors.redAccent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth / 12),
                    Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(height: 14),
                    Text("Full Name"),
                    SizedBox(height: 8),
                    TextField(
                      controller: userFullName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.white,
                        hintText: "E.g.: Ali Khan",
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
                      ),
                    ),
                    SizedBox(height: 14),
                    Text("Email Address"),
                    SizedBox(height: 8),
                    TextField(
                      controller: userEmailAddress,
                      keyboardType: .emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.white,
                        hintText: "donor@example.com",
                        hintStyle: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: MyTextColors.lightGrey),
                        prefixIcon: Icon(
                          Icons.email,
                          color: MyColors.mediumGrey,
                        ),
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
                    Text("Phone Number (WhatsApp)"),
                    SizedBox(height: 8),
                    TextField(
                      controller: userPhoneNumber,
                      keyboardType: .phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.white,
                        hintText: "+92 300 1234567",
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
                      ),
                    ),
                    SizedBox(height: 14),
                    Row(
                      children: [
                        SizedBox(
                          width: (screenWidth / 2) - 30.5,
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Blood Group"),
                              SizedBox(height: 8),
                              DropdownMenu(
                                controller: userBloodGroup,
                                inputDecorationTheme: InputDecorationTheme(
                                  filled: true,
                                  fillColor: MyColors.white,
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
                                menuStyle: MenuStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    MyColors.white,
                                  ),
                                ),
                                width: (screenWidth / 2) - 30.5,
                                dropdownMenuEntries: List.generate(
                                  bloodGroups.length,
                                  (index) {
                                    return DropdownMenuEntry(
                                      value: bloodGroups[index]["type"],
                                      label:
                                          bloodGroups[index]["label"] as String,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth / 20),
                        SizedBox(
                          width: (screenWidth / 2) - 30.5,
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("City"),
                              SizedBox(height: 8),
                              DropdownMenu(
                                controller: userCity,
                                menuStyle: MenuStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    MyColors.white,
                                  ),
                                ),
                                inputDecorationTheme: InputDecorationTheme(
                                  filled: true,
                                  fillColor: MyColors.white,
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
                                width: (screenWidth / 2) - 30.5,
                                dropdownMenuEntries: List.generate(
                                  cities.length,
                                  (index) {
                                    return DropdownMenuEntry(
                                      value: cities[index]["cityName"],
                                      label:
                                          cities[index]["cityName"] as String,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    Text("Enter Password"),
                    SizedBox(height: 8),
                    TextField(
                      controller: userPassword,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.white,
                        hintText: "Password",
                        hintStyle: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: MyTextColors.lightGrey),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: MyColors.mediumGrey,
                        ),
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
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: MyColors.mediumGrey,
                          ),
                        ),
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
                    Text("Confirm Password"),
                    SizedBox(height: 8),
                    TextField(
                      controller: userConfirmPassword,
                      obscureText: obscureConfirmPassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.white,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: MyColors.mediumGrey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (obscureConfirmPassword == true) {
                              obscureConfirmPassword = false;
                            } else {
                              obscureConfirmPassword = true;
                            }
                            setState(() {});
                          },
                          child: Icon(
                            obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: MyColors.mediumGrey,
                          ),
                        ),
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Container(
                  padding: .all(10),
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: MyColors.lightPink,
                    borderRadius: .circular(8),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Text("Available to donate blood?"),
                          Text("You can turn this off anytime in settings"),
                        ],
                      ),
                      SizedBox(width: (screenWidth / 3.8) - 60),
                      Switch(
                        activeTrackColor: MyColors.darkGreen,
                        value: DonorAvailability.donorAvailable,
                        onChanged: (value) {
                          setState(() {
                            DonorAvailability.donorAvailable = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                MyPrimaryButton(
                  "Register as Donor",
                  onTap: () async {
                    List<TextEditingController> controllers = [
                      userFullName,
                      userEmailAddress,
                      userPhoneNumber,
                      userBloodGroup,
                      userCity,
                      userPassword,
                      userConfirmPassword,
                    ];
                    if (controllers.any(
                      (controller) => controller.text.isEmpty,
                    )) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: .floating,
                          backgroundColor:
                          BloodDonationAvailabilityCardsColors.borderYellow,
                          content: Row(
                            crossAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.warning_amber,
                                color: BloodDonationAvailabilityCardsColors
                                    .titleYellow,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Please fill all the fields!",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: MyColors.brightRed),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (userPassword.text != userConfirmPassword.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: .floating,
                          backgroundColor:
                              BloodDonationAvailabilityCardsColors.borderYellow,
                          content: Row(
                            crossAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.warning_amber,
                                color: BloodDonationAvailabilityCardsColors
                                    .titleYellow,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Passwords don't match!",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: MyColors.brightRed),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      await Future.delayed(Duration(seconds: 1))
                          .then((onValue) {
                            if (mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                          });
                    }
                  },
                ),
                SizedBox(height: screenHeight / 16),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text("Already registered?"),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
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
    );
  }
}
