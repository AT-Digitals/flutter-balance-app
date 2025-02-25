import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final double fontSize;
  final double iconSize;

 CommonTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = const Color(0xFF3739c0),
    IconData? icon, // Make it nullable for initialization
    this.iconColor = const Color(0xFF3739c0),
    this.fontSize = 18,
    this.iconSize = 18,
  })  : icon = (text == "Back") ? Icons.arrow_back : Icons.arrow_forward, // Assign icon properly
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent, // No background
        foregroundColor: Colors.black, // Text color
        overlayColor: Colors.transparent, // No hover effect
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: text == "Back"
            ? [ // If "Back", show icon first
                Icon(icon, color: iconColor, size: iconSize),
                SizedBox(width: 4),
                Text(text, textAlign: TextAlign.center, style: TextStyle(color: textColor, fontSize: fontSize)),
              ]
            : [ // Else, show text first, then icon
                Text(text, textAlign: TextAlign.center, style: TextStyle(color: textColor, fontSize: fontSize)),
                SizedBox(width: 4),
                Icon(icon, color: iconColor, size: iconSize),
              ],
      ),
    );
  }
}
