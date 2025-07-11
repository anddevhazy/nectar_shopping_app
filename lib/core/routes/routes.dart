// class Routes {
//   static const String loginPath = '/login';
//   static const String loginName = 'login';

//   static const String uploadProfilePicturePath = '/uploadProfilePicture';
//   static const String uploadProfilePictureName = 'uploadProfilePicture';

//   static const String pendingDeliveriesPath = '/pendingDeliveries';
//   static const String pendingDeliveriesName = 'pendingDeliveries';

//   static const String verifyYourEmployeeIdPath = '/verifyYourEmployeeId';
//   static const String verifyYourEmployeeIdName = 'verifyYourEmployeeId';

//   static const String completedPath = '/completed';
//   static const String completedName = 'completed';

//   static const String settingsPath = '/settings';
//   static const String settingsName = 'settings';

//   static final GlobalKey<NavigatorState> rootNavigatorKey =
//       GlobalKey<NavigatorState>();
//   static final GlobalKey<NavigatorState> shellNavigatorKey =
//       GlobalKey<NavigatorState>();

//   static final GoRouter router = GoRouter(
//     navigatorKey: rootNavigatorKey,
//     initialLocation: loginPath,
//     routes: [
//       GoRoute(
//         path: loginPath,
//         name: loginName,
//         builder: (context, state) => const LoginPage(),
//       ),
//       GoRoute(
//         path: verifyYourEmployeeIdPath,
//         name: verifyYourEmployeeIdName,
//         builder: (context, state) {
//           final rider = state.extra as RiderEntity;
//           return VerifyYourEmployeeIdPage(rider: rider);
//         },
//       ),
//       GoRoute(
//         path: uploadProfilePicturePath,
//         name: uploadProfilePictureName,
//         builder: (context, state) {
//           final data = state.extra! as Map<String, dynamic>;

//           return UploadProfilePictureScreen(
//             employeeId: data['employeeId'],
//             id: data['id'],
//           );
//         },
//       ),
//       ShellRoute(
//         navigatorKey: shellNavigatorKey,
//         builder:
//             (context, state, child) =>
//                 MainScreen(routeState: state, child: child),
//         routes: [
//           GoRoute(
//             path: pendingDeliveriesPath,
//             name: pendingDeliveriesName,
//             builder: (context, state) => const PendingDeliveriesScreen(),
//           ),
//           GoRoute(
//             path: completedPath,
//             name: completedName,
//             builder: (context, state) => const CompletedScreen(),
//           ),
//           GoRoute(
//             path: settingsPath,
//             name: settingsName,
//             builder: (context, state) => const SettingsScreen(),
//           ),
//         ],
//       ),
//     ],
//     errorBuilder:
//         (context, state) =>
//             Scaffold(body: Center(child: Text(state.error.toString()))),
//   );
// }
