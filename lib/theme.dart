import 'package:flutter/material.dart';

abstract class TxtThemes {
  static const TextStyle extraB24 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 24);

  static const TextStyle extraB13 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 13);

  static const TextStyle semiB12 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 12);

  static const TextStyle bold11 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 11);

  static const TextStyle bold72 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 72);

  static const TextStyle black9 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 9);

  static const TextStyle black11 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 11);

  static const TextStyle black12 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 12);

  static const TextStyle black16 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 16);

  static const TextStyle black18 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  static const TextStyle black36 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 36);
}

abstract class TxtThemesXl {
  static const TextStyle extraB24 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 24);

  static const TextStyle extraB13 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 13);

  static const TextStyle semiB12 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 20);

  static const TextStyle bold11 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 24);

  static const TextStyle bold72 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 142);

  static const TextStyle black9 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 9);

  static const TextStyle black11 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 24);

  static const TextStyle black12 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 12);

  static const TextStyle black16 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 26);

  static const TextStyle black18 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 26);

  static const TextStyle black36 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 36);
}

abstract class TxtThemesXs {
  static const TextStyle extraB24 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 24);

  static const TextStyle extraB13 =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 13);

  static const TextStyle semiB12 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 11);

  static const TextStyle bold11 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 9);

  static const TextStyle bold72 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 48);

  static const TextStyle black9 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 9);

  static const TextStyle black11 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 9);

  static const TextStyle black12 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 12);

  static const TextStyle black16 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 14);

  static const TextStyle black18 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 17);

  static const TextStyle black36 =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 36);
}

abstract class MyColors {
  static const Color white = Color(0xffffffff);

  static const Color white2 = Color(0xffF5F5F5);

  static const Color primaryGray = Color(0xff333333);

  static const Color secondaryGray = Color(0xffE0E0E0);

  static const Color primaryPurple = Color(0xff4B3EAE);

  static const Color secondaryPurple = Color(0xff9087D4);

  static const Color purple1 = Color(0xffD4D1F0);

  static const Color purple2 = Color(0xffDBD9F2);

  static const Color purple3 = Color(0xffDDDBF3);

  static const Color fifo = Color(0xffF1F0FA);
}

Size getTxtSize(
    {required String txt,
    int maxLines = 1,
    required double factor,
    required TextStyle style}) {
  return (TextPainter(
          maxLines: maxLines,
          text: TextSpan(text: txt, style: style),
          textDirection: TextDirection.ltr,
          textScaleFactor: factor)
        ..layout())
      .size;
}
