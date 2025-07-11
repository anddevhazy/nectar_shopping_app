import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_mart/core/routes/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child, required this.routeState});
  final Widget child;
  final GoRouterState routeState;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<String> _tabs = [
    Routes.shopName,
    Routes.exploreName,
    Routes.cartName,
    Routes.favouriteName,
    Routes.accountName,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateWithCustomTransition(context, _tabs[index]);
  }

  void _navigateWithCustomTransition(BuildContext context, String routeName) {
    GoRouter.of(context).goNamed(routeName, extra: _customPageTransition());
  }

  CustomTransitionPage _customPageTransition() {
    return CustomTransitionPage(
      child: widget.child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    String path = widget.routeState.fullPath ?? "";
    if (path.contains(Routes.shopName)) {
      setState(() {
        _selectedIndex = 0;
      });
    } else if (path.contains(Routes.exploreName)) {
      setState(() {
        _selectedIndex = 1;
      });
    } else if (path.contains(Routes.cartName)) {
      setState(() {
        _selectedIndex = 2;
      });
    } else if (path.contains(Routes.favouriteName)) {
      setState(() {
        _selectedIndex = 3;
      });
    } else if (path.contains(Routes.accountName)) {
      setState(() {
        _selectedIndex = 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
