import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';
import 'package:khoon_app/views/home_navigation_bar/screens/chats_screen.dart';
import 'package:khoon_app/views/home_navigation_bar/screens/dashboard_screen.dart';
import 'package:khoon_app/views/home_navigation_bar/screens/profile_screen.dart';
import 'package:khoon_app/views/home_navigation_bar/screens/requests_screen.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int activeScreenIndex = 0;

  List<Map<String, dynamic>> myScreens = [
    {"screen": DashboardScreen(), "title": "Home", "icon": Icons.dashboard_rounded},
    {
      "screen": RequestsScreen(),
      "title": "Requests",
      "icon": Icons.local_hospital,
    },
    {"screen": ChatsScreen(), "title": "Chats", "icon": Icons.chat_rounded},
    {"screen": ProfileScreen(), "title": "Profile", "icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 10.0,
            children: [
              Expanded(child: myScreens[activeScreenIndex]["screen"]),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 70.0,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  border: .all(color: MyColors.lightGrey, width: 1.0),
                  borderRadius: .circular(12),
                ),
                child: Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: List.generate(myScreens.length, (index) {
                    debugPrint('The icon is ${myScreens[index]['icon']}');

                    return InkWell(
                      onTap: () {
                        activeScreenIndex = index;

                        debugPrint("option tapped!");
                        setState(() {});
                      },
                      child: SizedBox(
                        width: (screenWidth - 24) / 5,
                        height: 68,
                        child: Column(
                          spacing: 4.0,
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            Container(
                              width: 50.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: .circular(8.0),
                                color: activeScreenIndex == index
                                    ? MyColors.lightPink
                                    : MyColors.white,
                              ),
                              child: Icon(
                                myScreens[index]["icon"],
                                color: activeScreenIndex == index
                                    ? MyColors.brightRed
                                    : MyColors.lightGrey,
                              ),
                            ),
                            Text(
                              myScreens[index]["title"],
                              style: TextStyle(
                                color: activeScreenIndex == index
                                    ? MyTextColors.redAccent
                                    : MyTextColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
