import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/constants/constants.dart';
import 'package:quotes_app/controller/project_contorller.dart';
import 'package:quotes_app/main.dart';
import 'package:quotes_app/responsive/responsive.dart';
import 'package:quotes_app/components/project_grid.dart';


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
    return Container(
      width: double.infinity,
      height:  MediaQuery.of(context).size.height*0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          if(Responsive.isLargeMobile(context)) const SizedBox(
            height: defaultPadding,
          ),
          Expanded(child: 
          Responsive(
                  desktop: ProjectGrid(crossAxiscount: 3,),
                  extraLargeScreen: ProjectGrid(crossAxiscount: 4,),
                  largeMobile: ProjectGrid(crossAxiscount: 1,ratio: 1.8),
                  mobile: ProjectGrid(crossAxiscount: 1,ratio: 1.5),
                  tablet: ProjectGrid(ratio: 1.4,crossAxiscount: 2,)))
        ],
      ),
    );
  }
}