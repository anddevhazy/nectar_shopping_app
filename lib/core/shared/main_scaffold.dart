// // “When the user interacts with this screen, what are they trying to accomplish?”

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pinpoint_driver/core/extensions/context_extensions.dart';
// import 'package:pinpoint_driver/core/routes/routes.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key, required this.child, required this.routeState});
//   final Widget child;
//   final GoRouterState routeState;
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   static const List<String> _tabs = [
//     Routes.pendingDeliveriesName,
//     Routes.settingsName,
//     Routes.completedName,
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _navigateWithCustomTransition(context, _tabs[index]);
//   }

//   void _navigateWithCustomTransition(BuildContext context, String routeName) {
//     GoRouter.of(context).goNamed(routeName, extra: _customPageTransition());
//   }

//   CustomTransitionPage _customPageTransition() {
//     return CustomTransitionPage(
//       child: widget.child,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: animation,
//           child: child,
//         );
//       },
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant MainScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     String path = widget.routeState.fullPath ?? "";
//     if (path.contains(Routes.pendingDeliveriesName)) {
//       setState(() {
//         _selectedIndex = 0;
//       });
//     } else if (path.contains(Routes.settingsName)) {
//       setState(() {
//         _selectedIndex = 1;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.child,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: const Color(0xFF0120F4),
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_work_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.motorcycle_rounded),
//             label: 'Completed',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
