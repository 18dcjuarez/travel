import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

// Main Colors
const Color aquamarine = Color(0xFF00C8D8);
const Color blue = Color(0xFF0088BA);
const Color darkBlue = Color(0xFF004359);
const Color darkGrey = Color(0xFF3E3E3E);
const Color darkYellow = Color(0xFFEC9922);
const Color grey = Color(0xFF717171);
const Color lightGrey = Color(0xFFACACAC);
const Color lightestGrey = Color(0xFFF2F2F2);
const Color pink = Color(0xFFFF256C);
const Color red = Color(0xFF901600);
const Color turquoise = Color(0xFF00C8D8);
const Color yellow = Color(0xFFFFBF00);
const Color white = Color(0xFFFFFFFF);

class TraveTheme {
  static get theme {
    final textTheme = TextTheme(
      headline1: TextStyle(
        fontSize: 50.w,
        color: white,
        fontWeight: FontWeight.w900,
      ),
      headline2: TextStyle(
        fontSize: 34.w,
        color: white,
        fontWeight: FontWeight.w800,
      ),
      headline3: TextStyle(
        fontSize: 20.w,
        color: white,
      ),
      headline4: TextStyle(
        fontSize: 16.w,
        color: white,
      ),
      bodyText1: TextStyle(
        fontSize: 16.w,
        color: white,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontSize: 13.w,
        color: white,
      ),
      caption: TextStyle(
        fontSize: 11.5.w,
        color: Colors.black,
      ),
    );
    return ThemeData(
      primaryColor: turquoise,
      accentColor: white,
      backgroundColor: white,
      scaffoldBackgroundColor: white,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
