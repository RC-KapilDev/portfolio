import 'package:flutter/material.dart';
import 'package:quotes_app/screens/projects_screen.dart';
import 'package:quotes_app/screens/skills_screentry1.dart';
import 'widgets/nav_buttons.dart';
import 'constants/constants.dart';
import 'screens/home_screen.dart';






void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final navButtonKey = GlobalKey();
  final skillsButtonKey = GlobalKey();

  Future scrollToItem(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context,
          alignment: 0.5, duration: const Duration(milliseconds: 700));
    }
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: Theme.of(context).copyWith(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kMainBackGroundColor,
        appBar: AppBar(
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
                    onPress: () => scrollToItem(navButtonKey),
                  ),
                  NavButton(
                    text: 'Project',
                    onPress: () => scrollToItem(skillsButtonKey),
                  ),
                  // NavButton(text: 'Open Source'),
                  // NavButton(text: 'Contact Me'),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const HomeScreen(),
                Column(
                  key: navButtonKey,
                  children: const [
                    SkillsScreen(),
                  ],
                ),
                Container(key: skillsButtonKey, child: ProjectScreen()),
              ],
            ),
          ),
        ),
       
      ),
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
}







