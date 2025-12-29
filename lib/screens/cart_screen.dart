import 'package:appers_ecommerce_app/providers/cart_provider.dart';
import 'package:appers_ecommerce_app/widgets/cart_item_tile.dart';
import 'package:appers_ecommerce_app/widgets/cart_total_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = cart.items.values.toList()[index];

                      // cart items

                      return CartItemTile(item: item);
                    },
                  ),
                ),

                // cart total
                CartTotalSection(cart: cart),
              ],
            ),
    );
  }
}
