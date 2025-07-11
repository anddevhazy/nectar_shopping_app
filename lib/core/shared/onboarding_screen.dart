import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_mart/core/theme/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/delivery_man.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? buildMainColumn()
                      : SingleChildScrollView(child: buildMainColumn()),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildMainColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Image.asset('assets/white_carrot.png', height: 48.h, width: 56.w),

      SizedBox(height: 35.h),

      Text(
        "Welcome",
        style: GoogleFonts.roboto(
          fontSize: 48.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          letterSpacing: 0.sp,
          height: 0.6, // = 29 / 48
        ),
      ),
      SizedBox(height: 28.h),
      Text(
        "to our store",
        style: GoogleFonts.roboto(
          fontSize: 48.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          letterSpacing: 0.sp,
          height: 0.6, // = 29 / 48
        ),
      ),

      SizedBox(height: 19.h),

      Text(
        "Get your groceries in as fast as one hour",
        style: GoogleFonts.roboto(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          letterSpacing: 0.sp,
          height: 0.9, // = 15 / 16
        ),
      ),
      SizedBox(height: 40.h),
      SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 0,
          ),
          child: Text(
            "Get started",
            style: GoogleFonts.roboto(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 0.sp,
              height: 1.0, // = 18 / 18
            ),
          ),
        ),
      ),

      SizedBox(height: 90.h),
    ],
  );
}
