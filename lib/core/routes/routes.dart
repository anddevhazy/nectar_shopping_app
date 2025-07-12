import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_mart/core/shared/main_scaffold.dart';
import 'package:grocery_mart/core/shared/onboarding_screen.dart';
import 'package:grocery_mart/core/shared/splash_screen.dart';
import 'package:grocery_mart/features/auth/presentation/pages/login_screen.dart';
import 'package:grocery_mart/features/cart/presentation/pages/cart_screen.dart';
import 'package:grocery_mart/features/shop/presentation/pages/shop_screen.dart';
import 'package:grocery_mart/features/temp_placeholder/account_screen.dart';
import 'package:grocery_mart/features/temp_placeholder/explore_screen.dart';
import 'package:grocery_mart/features/temp_placeholder/favourite_screen.dart';
import 'package:grocery_mart/features/temp_placeholder/order_accepted_screen.dart';

class Routes {
  static const String splashPath = '/splash';
  static const String splashName = 'splash';

  static const String onboardingPath = '/onboarding';
  static const String onboardingName = 'onboarding';

  static const String loginPath = '/login';
  static const String loginName = 'login';

  static const String shopPath = '/shop';
  static const String shopName = 'shop';

  static const String cartPath = '/cart';
  static const String cartName = 'cart';

  static const String accountPath = '/account';
  static const String accountName = 'account';

  static const String explorePath = '/explore';
  static const String exploreName = 'explore';

  static const String favouritePath = '/favourite';
  static const String favouriteName = 'favourite';

  static const String orderAcceptedPath = '/orderAccepted';
  static const String orderAcceptedName = 'orderAccepted';

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,

    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        name: splashName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginPath,
        name: loginName,
        builder:
            (context, state) => const LoginScreen(
              emailController: null,
              passwordController: null,
            ),
      ),
      GoRoute(
        path: onboardingPath,
        name: onboardingName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder:
            (context, state, child) =>
                MainScreen(routeState: state, child: child),
        routes: [
          GoRoute(
            path: shopPath,
            name: shopName,
            builder: (context, state) => const ShopScreen(),
          ),
          GoRoute(
            path: cartPath,
            name: cartName,
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            path: orderAcceptedPath,
            name: orderAcceptedName,
            builder: (context, state) => const OrderAcceptedScreen(),
          ),
          GoRoute(
            path: explorePath,
            name: exploreName,
            builder: (context, state) => const ExploreScreen(),
          ),
          GoRoute(
            path: favouritePath,
            name: favouriteName,
            builder: (context, state) => const FavouriteScreen(),
          ),
          GoRoute(
            path: accountPath,
            name: accountName,
            builder: (context, state) => const AccountScreen(),
          ),
        ],
      ),
    ],
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text(state.error.toString()))),
  );
}
