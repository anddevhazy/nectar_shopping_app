import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_mart/core/routes/routes.dart';
import 'package:grocery_mart/features/cart/presentation/bloc/cart_cubit.dart';

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
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                int itemCount = 0;
                if (state is Successful) {
                  itemCount = state.cartItems.fold(
                    0,
                    (sum, item) => sum + item.quantity,
                  );
                }
                return Stack(
                  children: [
                    const Icon(Icons.shopping_cart),
                    if (itemCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$itemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
