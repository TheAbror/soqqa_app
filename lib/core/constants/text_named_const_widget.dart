// * Create custom widget with named constructors

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;

  const AppText(this.text, this.style, this.color, {super.key});

  AppText.title1(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.title2(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: color,
        );

  AppText.title3(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.headline1(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: color,
        );

  AppText.headline2(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.text(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.paragraph1(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.paragraph2(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.subHeading(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.footNote(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.footNoteCaps(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.caption1(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.caption1Caps(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.caption2(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.caption2Caps(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.caption3(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: color,
        );

  AppText.caption3Caps(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.baseAccentTitle(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.baseAccentTitle2(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.customTitle2Medium(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.headline1Light(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        );

  AppText.paragraph1Medium(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: color,
        );

  AppText.subheadSemiBold(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color,
        );

  AppText.footnoteBold(this.text, this.color, {super.key})
      : style = TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: color,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

// * Usage AppText.caption3Caps('Hello World'),