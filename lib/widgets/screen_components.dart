import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home_screen.dart';
import 'package:quotes_app/screens/projects_screen.dart';
import 'package:quotes_app/screens/skills_screentry1.dart';
import 'package:quotes_app/main.dart';
import 'package:quotes_app/widgets/nav_buttons.dart';
import 'package:quotes_app/constants/constants.dart';

SingleChildScrollView mainWidgetScroll() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(key: homeGlobalKey, child: const HomeScreen()),
          Container(key: skillsGlobalKey, child: const SkillsScreen()),
          Container(key: projectGlobalKey, child: ProjectScreen()),
        ],
      ),
    ),
  );
}

AppBar appBarNav() {
  Future scrollToItem(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context,
          alignment: 0.5, duration: const Duration(milliseconds: 700));
    }
  }

  return AppBar(
    toolbarHeight: 100,
    backgroundColor: kMainBackGroundColor,
    actions: [
      Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            logoButton(),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavButton(
              text: 'Skills',
              onPress: () => scrollToItem(skillsGlobalKey),
            ),
            NavButton(
              text: 'Project',
              onPress: () => scrollToItem(projectGlobalKey),
            ),
            // NavButton(text: 'Open Source'),
            // NavButton(text: 'Contact Me'),
          ],
        ),
      )
    ],
  );
}

InkWell logoButton() {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 300,

      alignment: Alignment.center, // Optional: Center logo within button
      // constraints: const BoxConstraints.tightFor(
      //   width: 100.0, // Adjust width as needed (e.g., based on logo size)
      //   height:100.0,
      // ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle, // Use circle shape for a logo button
        color: Colors.white, // Customize background color
        border:
            Border.all(color: Colors.blue, width: 2.0), // Add optional border
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Optional subtle shadow
            spreadRadius: 2.0, // Adjust spread radius as needed
            blurRadius: 4.0, // Adjust blur radius as needed
          ),
        ],
      ),
      child: Image.asset(
        'images/logo.jpg',
        // Replace with your logo's file path
        // Adjust fit as needed (e.g., cover, fill)
      ),
    ),
  );
}
