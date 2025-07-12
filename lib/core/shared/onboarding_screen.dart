import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_mart/core/routes/routes.dart';
import 'package:grocery_mart/core/theme/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageZoomController;
  late Animation<double> _imageScale;

  late AnimationController _textSlideController;
  late Animation<Offset> _slideAnimation;

  late AnimationController _buttonFadeController;
  late Animation<double> _buttonFadeAnimation;

  @override
  void initState() {
    super.initState();

    _imageZoomController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _imageScale = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _imageZoomController, curve: Curves.easeOut),
    );
    _imageZoomController.forward();

    _textSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textSlideController, curve: Curves.easeOutCubic),
    );

    _buttonFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _buttonFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _buttonFadeController, curve: Curves.easeIn),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _textSlideController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _buttonFadeController.forward();
  }

  @override
  void dispose() {
    _imageZoomController.dispose();
    _textSlideController.dispose();
    _buttonFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScaleTransition(
            scale: _imageScale,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/delivery_man.png'),
                  fit: BoxFit.cover,
                ),
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

  Widget buildMainColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              Image.asset('assets/white_carrot.png', height: 48.h, width: 56.w),
              SizedBox(height: 35.h),
              Text(
                "Welcome",
                style: GoogleFonts.roboto(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  height: 0.6,
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                "to our store",
                style: GoogleFonts.roboto(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  height: 0.6,
                ),
              ),
              SizedBox(height: 19.h),
              Text(
                "Get your groceries in as fast as one hour",
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 0.9,
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
        FadeTransition(
          opacity: _buttonFadeAnimation,
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.loginName);
              },
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
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 90.h),
      ],
    );
  }
}
