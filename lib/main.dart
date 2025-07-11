// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grocery_mart/core/shared/onboarding_screen.dart';
// import 'package:grocery_mart/core/shared/splash_screen.dart';
// import 'package:grocery_mart/features/auth/presentation/pages/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(414, 896),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           // home: const OnboardingScreen(),
//           // home: const NectarSplashScreen(),
//           home: const LoginScreen(),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/shared/onboarding_screen.dart';
import 'package:grocery_mart/core/shared/splash_screen.dart';
import 'package:grocery_mart/features/auth/presentation/pages/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: const OnboardingScreen(),
          // home: const NectarSplashScreen(),
          home: LoginScreen(
            emailController: emailController,
            passwordController: passwordController,
          ),
          // home: LogScreen(
          //   emailController: emailController,
          //   passwordController: passwordController,
          // ),
        );
      },
    );
  }
}
