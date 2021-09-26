import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appPrimaryTheme() => ThemeData(
      brightness: Brightness.light,
      backgroundColor:Colors.white,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 1.0,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      dividerColor: Colors.grey[300],
      dividerTheme: const DividerThemeData(thickness: 0.5),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        headline3: GoogleFonts.montserrat(
          fontSize: 42.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline4: GoogleFonts.montserrat(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline5: GoogleFonts.montserrat(
          fontSize: 24.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headline6: GoogleFonts.montserrat(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        subtitle1: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        subtitle2: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyText1: GoogleFonts.montserrat(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyText2: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        button: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
      )),
    );
