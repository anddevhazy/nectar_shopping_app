import 'package:get_it/get_it.dart';
import 'package:grocery_mart/features/cart/cart_injection_container.dart';
import 'package:grocery_mart/features/shop/shop_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await cartInjectionContainer();
  await shopInjectionContainer();
}
