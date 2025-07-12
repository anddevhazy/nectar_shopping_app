import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mart/core/routes/routes.dart';
import 'package:grocery_mart/features/shop/presentation/bloc/shop_cubit.dart';
import 'package:grocery_mart/main_injection_container.dart' as di;
import 'package:grocery_mart/features/cart/presentation/bloc/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(create: (context) => di.sl<CartCubit>()),
        BlocProvider<ShopCubit>(create: (context) => di.sl<ShopCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: Routes.router,
          );
        },
      ),
    );
  }
}
