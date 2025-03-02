import 'package:flutter/material.dart';

class ARoundedContainer extends StatelessWidget {
  const ARoundedContainer({
    super.key,
    this.height = 180,
    this.bgColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.width = 360,
    this.borderRadius = 15,
    required this.child,
    this.margin = const EdgeInsets.all(8),
    this.padding,
  });

  final Color bgColor, shadowColor;
  final Widget child;
  final double height, width;
  final double borderRadius;
  final EdgeInsetsGeometry? margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
