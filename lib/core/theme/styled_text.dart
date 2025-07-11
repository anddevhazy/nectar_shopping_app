import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double letterSpacing;
  final double height;

  const StyledText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.letterSpacing,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing.sp,
        height: height / fontSize,
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class StyledText extends StatelessWidget {
//   final String text;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final Color color;
//   final double letterSpacing;
//   final double height;

//   const StyledText({
//     Key? key,
//     required this.text,
//     this.fontSize = 16,
//     this.fontWeight = FontWeight.normal,
//     this.color = Colors.black,
//     this.letterSpacing = 0,
//     this.height = 1.0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: GoogleFonts.roboto(
//         fontSize: fontSize.sp,
//         fontWeight: fontWeight,
//         color: color,
//         letterSpacing: letterSpacing.sp,
//         height: height,
//       ),
//     );
//   }
// }

