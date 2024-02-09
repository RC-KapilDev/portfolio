import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/constants/constants.dart';
import 'package:quotes_app/controller/project_contorller.dart';

import 'package:quotes_app/responsive/responsive.dart';
import 'package:quotes_app/components/project_grid.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quotes_app/constants/constants.dart';


// final List<List<String>> projectsList = [
//   ['images/projects/college.jpg','College Application','https://github.com/RC-KapilDev/College_application'],
//   ['images/projects/bakery.png','Online-bakery','https://online-bakery-kohl.vercel.app/'],
//   ['images/projects/exp.jpg','Expense_Manager','https://github.com/RC-KapilDev/expense_app'],
// ];

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key});
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ 
        Center(
          child: AnimatedTextKit(animatedTexts: [
                  
                  ColorizeAnimatedText(
                          'Projects and Open Source',
                          textStyle:   TextStyle(
                            fontSize:  size.width > 700 && size.width < 750 ? defaultPadding+10 : size.width<470 ? defaultPadding+5 : size.width>600 && size.width < 700 ? defaultPadding+5 : size.width >900  ? defaultPadding+15 : defaultPadding,
                            fontWeight: FontWeight.w500,
                          ),
                          colors: colorizeColors,
                        ),
                        
                       
                ]),
        ),
        if(Responsive.isLargeMobile(context)) const SizedBox(
          height: defaultPadding+10,
        ),
        Responsive(
                desktop: ProjectGrid(crossAxiscount: 3,),
                extraLargeScreen: ProjectGrid(crossAxiscount: 4,),
                largeMobile: ProjectGrid(crossAxiscount: 1,ratio: 1.8),
                mobile: ProjectGrid(crossAxiscount: 1,ratio: 1.5),
                tablet: ProjectGrid(ratio: 1.4,crossAxiscount: 2,))
      ],
    );
  }
}