import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class averageResult extends StatelessWidget {
  final double result;
  final int lesson;

  const averageResult({super.key, required this.lesson, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Avarage',
          style: GoogleFonts.robotoCondensed(fontSize: 30.0, fontWeight: FontWeight.w800, color: Color.fromARGB(172, 244, 65, 55)),
        ),
        Text(
          result >=0 ? '${result.toStringAsFixed(2)}' : '0.0',
          style: GoogleFonts.robotoCondensed(fontSize: 65.0, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        Text(
          lesson > 0 ? '$lesson lessons entered' : 'Please select a lesson!',
          style: GoogleFonts.robotoCondensed(fontSize: 20.0, fontWeight: FontWeight.w900, color: Colors.blue),
        ),
 
      ],
    );
  }
}