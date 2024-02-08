import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SocilaMediaButton extends StatelessWidget {
  const SocilaMediaButton({super.key,required this.imgurl,required this.link});
final String imgurl;
final Uri link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        if(!await launchUrl(link)){
          throw Exception('Could not launch $link');
        }
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)

        ),
        child: Center(
          child: Image.asset(imgurl,width: 40,height: 40,),
        ),
      ),
    );
  }
}