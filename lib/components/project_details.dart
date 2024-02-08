import 'package:flutter/material.dart';
import 'package:quotes_app/components/project_link.dart';
import 'package:quotes_app/constants/constants.dart';
import 'package:quotes_app/main.dart';
import 'package:quotes_app/model/project_model.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  const ProjectDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(projectList[index].name ,
          style: kconstNoramlText.copyWith(
            fontWeight: FontWeight.bold
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          projectList[index].description,
          style: const TextStyle(
            color: Colors.grey,
            height: 1.5
          ),
          maxLines: size.width > 700 && size.width < 750 ? 3 : size.width<470 ? 2 : size.width>600 && size.width < 700 ? 6 : size.width >900 && size.width<1060 ? 6 : 4,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        ProjectLinks(index: index),
        const SizedBox(
          height: defaultPadding/2,
        ),
      ],
    );
  }
}