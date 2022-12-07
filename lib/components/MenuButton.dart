import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.onTap,
      Key? key})
      : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    const contentStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return Container(
      margin: const EdgeInsets.all(16),
      height: 112,
      width: 150,
      decoration: BoxDecoration(
        color: buttonColor,
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
