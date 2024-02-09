import 'package:flutter/material.dart';
import 'package:quotes_app/constants/constants.dart';
import 'package:quotes_app/responsive/responsive.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('Skills and Abilities',
                    textStyle: kconstNoramlText.copyWith(
                        fontSize: 40, fontWeight: FontWeight.w500)),
                ColorizeAnimatedText(
                        'Skills and Abilities',
                        textStyle:  const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                        colors: colorizeColors,
                      ),
                      
                      TypewriterAnimatedText('Skills and Abilities',
                    textStyle: kconstNoramlText.copyWith(
                        fontSize: 40, fontWeight: FontWeight.w500))
              ]),
        if (Responsive.isLargeMobile(context))
          const SizedBox(
            height: defaultPadding+10,
          ),
        const Responsive(
            desktop: SkillsWidget(
              crossAxiscount: 6,
            ),
            extraLargeScreen: SkillsWidget(
              crossAxiscount: 5,
            ),
            largeMobile: SkillsWidget(crossAxiscount: 3, ratio: 1.8),
            mobile: SkillsWidget(crossAxiscount: 2, ratio: 1.5),
            tablet: SkillsWidget(
              ratio: 1.4,
              crossAxiscount: 3,
            ))
      ],
    );
  }
}

final List<List<String>> skillsList = [
  ['Css', 'images/css.png'],
  ['JavaScript', 'images/javascript.png'],
  ['JQuery', 'images/jquery.png'],
  ['FastAPI', 'images/fastapi.png'],
  ['C++', 'images/C++.png'],
  ['Flutter', 'images/flutter.png'],
  ['Dart', 'images/dartlogo.png'],
  ['Python', 'images/python.png'],
  ['Java', 'images/java.png'],
  ['Html', 'images/Htmk.png'],
];

class SkillsWidget extends StatelessWidget {
  final int crossAxiscount;
  final double ratio;
  const SkillsWidget({super.key, this.crossAxiscount = 3, this.ratio = 1.3});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(48),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxiscount,
          childAspectRatio: ratio,
          crossAxisSpacing: ratio * 10,
          mainAxisSpacing: ratio * 10),
      itemCount: skillsList.length,
      itemBuilder: (context, index) => Skillsdisplay(
        text: skillsList[index][0],
        logopath: skillsList[index][1],
      ),
    );
  }
}

class Skillsdisplay extends StatelessWidget {
  const Skillsdisplay({
    super.key,
    required this.text,
    required this.logopath,
  });

  final String text;
  final String logopath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              logopath,
              filterQuality: FilterQuality.high,
              fit: BoxFit.scaleDown,
              width: 140,
            ),
          ),
          Text(
            text,
            style: kconstNoramlText.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }
}
