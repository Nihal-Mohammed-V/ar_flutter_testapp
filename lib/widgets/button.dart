import 'package:flutter/material.dart';

class AButtonWidget extends StatelessWidget {
  const AButtonWidget({
    super.key,
    this.onTap,
    this.width = 130,
    this.height = 50,
    this.padding = 8,
    this.borderRadius = 10,
    required this.icon,
    required this.text,
    required this.bgColor,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  });

  final void Function()? onTap;
  final double width, height;
  final double padding, borderRadius;
  final IconData icon;
  final Color bgColor, iconColor, textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 20),
            SizedBox(width: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
