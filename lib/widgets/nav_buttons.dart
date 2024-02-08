import 'package:flutter/material.dart';
import 'package:quotes_app/main.dart';

class NavButton extends StatelessWidget {
  NavButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return const Color.fromARGB(255, 37, 140, 214); // Highlight color on hover
          }
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[100]!; // Highlight color on press
          }
          return Colors.white; // Use default color for other states
        },
      ),
      child: TextButton(
        onPressed: onPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 50, 119, 176)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          // ...other button styles
        ),
        child: Text(
          text,
          style: kconstNoramlText.copyWith(fontSize: 19),
        ),
      ),
    );
  }
}
