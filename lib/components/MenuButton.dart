import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton(
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
    return Container(
      margin: const EdgeInsets.all(16),
      height: 120,
      width: 150,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(25)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(42),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
