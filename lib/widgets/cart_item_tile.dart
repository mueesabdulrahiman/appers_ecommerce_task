import 'package:appers_ecommerce_app/models/cart_Item.dart';
import 'package:appers_ecommerce_app/providers/cart_provider.dart';
import 'package:appers_ecommerce_app/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Container(
      padding: EdgeInsets.all(isSmall ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image box
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(item.product.image, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),

          // Product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + delete
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                      onPressed: () => cart.removeFromCart(item.product.id),
                    ),
                  ],
                ),


                Text(
                  item.product.category.toUpperCase(),
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.2),
                ),

                const SizedBox(height: 8),

                // Price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.product.price}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    // Quantity selector 
                    Row(
                      children: [
                        QtyButton(
                          icon: Icons.remove,
                          onTap: () => cart.decreaseQuantity(item.product.id),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 10),
                        QtyButton(
                          icon: Icons.add,
                          onTap: () => cart.increaseQuantity(item.product.id),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
