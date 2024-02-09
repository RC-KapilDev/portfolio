import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:quotes_app/widgets/social_media_buttons.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:quotes_app/constants/constants.dart';

 

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  Uri stringToUri(String text) {
    return Uri.parse(text);
  }

  @override
  Widget build(BuildContext context) {
  
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      width: MediaQuery.of(context).size.width - 10,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(
                    'Hello all , I am Kapildev',
                    textStyle: kconstNoramlText.copyWith(fontSize: 50),
                  ),
                  ColorizeAnimatedText(
                    'Hello all , I am Kapildev',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ]),
                Text(
                  """A passionate Full Stack Software Developer 🚀 having an experience of building Web and Mobile applications with Flutter / JavaScript / Nodejs / HTML / CSS  and some other cool libraries and frameworks.""",
                  style: kconstNoramlText.copyWith(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SocilaMediaButton(
                        imgurl: 'images/lin.png',
                        link: stringToUri("https://www.linkedin.com/in/kapildev-flutter-developer/")),
                    SocilaMediaButton(
                        imgurl: 'images/github.png',
                        link: stringToUri("https://github.com/RC-KapilDev")),
                    SocilaMediaButton(
                        imgurl: 'images/yt.png',
                        link: stringToUri("https://youtube.com/@techeye7005?si=UWYBGZ-8JlOPwtu1")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    HomeScreenButtonMain(
                        geturl:
                            "https://export-download.canva.com/xuys4/DAF5vmxuys4/10/0-5690715734657880434.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJHKNGJLC2J7OGJ6Q%2F20240203%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240203T101136Z&X-Amz-Expires=82135&X-Amz-Signature=32f602b6a66ab66baf424a15176a8de6b7cd42bace7b7d1a4a82971999d8eb8d&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%2A%3DUTF-8%27%27googlesummerintership_resume.pdf&response-expires=Sun%2C%2004%20Feb%202024%2009%3A00%3A31%20GMT",
                        text: "See My Resume"),
                    SizedBox(
                      width: 20,
                    ),
                    HomeScreenButtonMain(
                      geturl: " ",
                      text: "Contact Me",
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Image.asset(
                "images/titleimg.png",
                cacheHeight: MediaQuery.of(context).size.height - 300 as int,
              ))
        ],
      ),
    );
  }
}

class HomeScreenButtonMain extends StatelessWidget {
  const HomeScreenButtonMain(
      {super.key, required this.text, required this.geturl});
  final String text;
  final String geturl;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        if ( geturl != " ") {
          if (!await launchUrl(Uri.parse(geturl))) {
            throw Exception('Could not launch $geturl');
          }
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF55198B),
        foregroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(25),
        textStyle: kconstNoramlText.copyWith(fontSize: 20),
      ),
      child: Text(text),
    );
  }
}
