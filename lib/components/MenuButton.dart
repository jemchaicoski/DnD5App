import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {required this.buttonText,
      required this.onTap,
      Key? key, this.isDarkMode})
      : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final isDarkMode;

  Color getBoxColorByTheme(bool isDarkMode){
    if (isDarkMode){
      return Colors.blueGrey;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {

    const contentStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return Container(
      margin: const EdgeInsets.all(16),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: getBoxColorByTheme(!isDarkMode),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  buttonText,
                  style: contentStyle,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
