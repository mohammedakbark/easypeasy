import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customeText({String? text, Color? textcolor, double? size}) {
  return Text(
    "$text",
    style: GoogleFonts.poppins(
      color: textcolor,
      fontWeight: FontWeight.w600,
      fontSize: size,
    ),
  );
}
