import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.borderRadius,
      required this.text,
      this.fontSize,
      this.onPressed});
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double? fontSize;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        onPressed: onPressed,
        child: Text(text,
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w900,
                color: textColor,
                fontSize: fontSize)),
      ),
    );
  }
}
