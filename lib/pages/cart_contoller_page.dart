import 'package:flutter/material.dart';
import 'package:grocery_store/pages/order_success.dart';
import 'package:grocery_store/pages/shopping_cart_page.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:provider/provider.dart';

class CartControllerPage extends StatelessWidget {
  CartControllerPage({super.key});

  final List pages = [
    const ShoppingCartPage(),
    OrderSuccessPage(
        appBarTitle: 'Shopping Cart',
        subtitle: "You will get a response within a few minutes.",
        title: "Your cart is empty !",
        btnText: 'Start shopping',
        onPressed: () {
        }),
  ];

  @override
  Widget build(BuildContext context) {
    int cartEmpty = context.watch<FruitProvider>().isCartEmpty();
    return Scaffold(
      body: pages[cartEmpty],
    );
  }
}
