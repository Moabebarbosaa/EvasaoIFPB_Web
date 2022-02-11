import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final Color? corText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;

  const CustomText({
    Key? key,
    required this.text,
    this.corText,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
    this.overflow,
    this.maxLines,
    this.textDirection
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        overflow: overflow,
        color: corText,
        fontSize: fontSize,
        //fontFamily: 'opensans',
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
