import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primary = const Color(0xFF2B637B);
final Color secondary = const Color(0xFF0d0b33);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.montserrat(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.montserrat(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.montserrat(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.montserrat(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.montserrat(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.poppins(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
