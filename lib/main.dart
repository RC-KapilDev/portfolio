import 'package:flutter/material.dart';
import 'package:quotes_app/screens/projects_screen.dart';
import 'package:quotes_app/screens/skills_screentry1.dart';
import 'widgets/nav_buttons.dart';
import 'screens/home_screen.dart';

const kconstNoramlText =
    TextStyle(fontFamily: 'Montserrat, sans-serif', color: Colors.white);
const kMainBackGroundColor = Color(0xFF171C28);



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

  Future Scrolltoitme(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context, alignment: 0.5,duration: const Duration(milliseconds: 700));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final media = MediaQuery.of(context).size;


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
                    LogoButton(),
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
                      onPress: () =>Scrolltoitme(navButtonKey),
                      
                    ),
                    NavButton(text: 'Project',
                    onPress: ()=>Scrolltoitme(skillsButtonKey),),
                    // NavButton(text: 'Open Source'),
                    // NavButton(text: 'Contact Me'),
                  ],
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // const HomeScreen(),
                Container(
                  key: navButtonKey,
                  child: const SkillsScreen()),
                 Container(key:skillsButtonKey ,child: ProjectScreen()),
                
            
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(onPressed: ()=>Scrolltoitme(),child: Icon(Icons.arrow_drop_up)),
    ),
    
    );
  }

  InkWell LogoButton() {
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







// ListView.builder(
//             itemCount: wid.length,
//             itemBuilder: (context, index) {
//               return wid[index];
//             },
//           )),