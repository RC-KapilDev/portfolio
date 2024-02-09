import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/components/project_info.dart';

import 'package:quotes_app/constants/constants.dart';
import 'package:quotes_app/controller/project_contorller.dart';
import 'package:quotes_app/model/project_model.dart';

class ProjectGrid extends StatelessWidget {
  ProjectGrid({super.key, this.crossAxiscount = 3, this.ratio = 1.3});
  final int crossAxiscount;
  final double ratio;
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      
      itemCount: projectList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxiscount, childAspectRatio: ratio),
        itemBuilder: (context, index) {
          return Obx(() => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(colors: [
                      Colors.pinkAccent,
                      Colors.blue,
                    ]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink,
                        offset: const Offset(-2, 0),
                        blurRadius: controller.hovers[index] ? 20 : 10,
                      )
                    ]),
                    child: ProjectStack(index: index,),
              ));
        });
  }
}
