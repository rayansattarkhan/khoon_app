import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/core/ui_components/buttons/action_button.dart';
import 'package:khoon_app/core/ui_components/buttons/cancel_button.dart';
import 'package:khoon_app/view_models/constants/blood_groups.dart';

class PostBloodRequestScreen extends StatefulWidget {
  const PostBloodRequestScreen({super.key});

  @override
  State<PostBloodRequestScreen> createState() => _PostBloodRequestScreenState();
}

class _PostBloodRequestScreenState extends State<PostBloodRequestScreen> {
  List<Map<String, Object>> bloodGroups = [
    {"label": "A+", "type": BloodGroups.aPositive()},
    {"label": "B+", "type": BloodGroups.bPositive()},
    {"label": "AB+", "type": BloodGroups.abPositive()},
    {"label": "O+", "type": BloodGroups.oPositive()},
    {"label": "A-", "type": BloodGroups.aNegative()},
    {"label": "B-", "type": BloodGroups.bNegative()},
    {"label": "AB-", "type": BloodGroups.abNegative()},
    {"label": "O-", "type": BloodGroups.oNegative()},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Text(
                    "Post Blood Request",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: screenHeight / 60),
                Text(
                  "Patient Name *",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    hintText: "E.g.: Ali Khan",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    filled: true,
                    fillColor: MyColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.5 - 15,
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Blood Group *",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: screenHeight * 0.006),
                          DropdownMenu(
                            width: screenWidth * 0.5 - 15,
                            inputDecorationTheme: InputDecorationTheme(
                              filled: true,
                              fillColor: MyColors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: .circular(8),
                                borderSide: BorderSide(
                                  color: MyColors.lightGrey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: .circular(8),
                                borderSide: BorderSide(
                                  color: MyColors.lightGrey,
                                ),
                              ),
                            ),
                            menuStyle: MenuStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                MyColors.white,
                              ),
                            ),
                            dropdownMenuEntries: List.generate(
                              bloodGroups.length,
                              (index) {
                                return DropdownMenuEntry(
                                  value: bloodGroups[index]["type"],
                                  label: bloodGroups[index]["label"] as String,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: screenWidth * 0.5 - 15,
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Bags/ Units *",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: screenHeight * 0.006),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: .symmetric(vertical: 19, horizontal: 12),
                              hintText: "E.g.: 300cc or 1 bag",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              filled: true,
                              fillColor: MyColors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: .circular(8),
                                borderSide: BorderSide(
                                  color: MyColors.lightGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: .circular(8),
                                borderSide: BorderSide(
                                  color: MyColors.lightGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Hospital & Ward *",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    hintText: "E.g.: Ward 3, Khyber Teaching Hospital(KTH)",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    filled: true,
                    fillColor: MyColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text("City *", style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    hintText: "E.g.: Peshawar",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    filled: true,
                    fillColor: MyColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Required Urgency *",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: .circular(8),
                        border: .all(color: MyColors.lightGrey),
                      ),
                      width: screenWidth / 3 - 8,
                      height: screenHeight / 14,
                      child: Center(
                        child: Text(
                          "Within 2-4 Hrs",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: MyTextColors.mediumGrey),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: .circular(8),
                        border: .all(color: MyColors.lightGrey),
                      ),
                      width: screenWidth / 3 - 8,
                      height: screenHeight / 14,
                      child: Center(
                        child: Text(
                          "Within 12 Hrs",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: MyTextColors.mediumGrey),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: .circular(8),
                        border: .all(color: MyColors.lightGrey),
                      ),
                      width: screenWidth / 3 - 8,
                      height: screenHeight / 14,
                      child: Center(
                        child: Text(
                          "Within 24 Hrs",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: MyTextColors.mediumGrey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Attendant Phone / WhatsApp *",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  decoration: InputDecoration(
                    hintText: "E.g.: 0300 1234567",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    filled: true,
                    fillColor: MyColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Additional Details / Instructions",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: screenHeight * 0.006),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "E.g.: Emergency surgery. Please contact attendant directly...",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    filled: true,
                    fillColor: MyColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(color: MyColors.lightGrey),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                MyActionButton("Publish Emergency Request"),
                SizedBox(height: screenHeight * 0.015),
                MyCancelButton(
                  "Cancel Request",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget row1 = Row(
//   children: [
//     Column(
//       children: [
//         Text(
//           "Bags / Units *",
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//         SizedBox(height: screenHeight * 0.006),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "E.g.: 300cc or 300ml or 1 Bag",
//             hintStyle: Theme.of(context).textTheme.bodyMedium,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: .circular(8),
//               borderSide: BorderSide(color: MyColors.lightGrey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: .circular(8),
//               borderSide: BorderSide(color: MyColors.lightGrey),
//             ),
//           ),
//         ),
//       ],
//     ),
//     Column(
//       children: [
//         Text(
//           "Bags / Units *",
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//         SizedBox(height: screenHeight * 0.006),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "E.g.: 300cc or 300ml or 1 Bag",
//             hintStyle: Theme.of(context).textTheme.bodyMedium,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: .circular(8),
//               borderSide: BorderSide(color: MyColors.lightGrey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: .circular(8),
//               borderSide: BorderSide(color: MyColors.lightGrey),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ],
// );
