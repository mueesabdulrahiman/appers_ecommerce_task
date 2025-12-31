import 'package:appers_ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildCategoryRow(BuildContext context) {
    final categories = [
      'All',
      'Men\'s Clothing',
      'Women\'s Clothing',
      'Jewelery',
      'Electronics',
    ];
    final productProvider = context.watch<ProductProvider>();

    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected =
              productProvider.selectedCategory == categories[index];

          return GestureDetector(
            onTap: () {
              context.read<ProductProvider>().selectCategory(categories[index]);
            },
            child: Chip(
              elevation: 2,
              side: BorderSide.none,
              shape: StadiumBorder(),
              backgroundColor: isSelected ? scheme.secondary : scheme.surface,
              label: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? scheme.onSecondary : scheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemCount: categories.length,
      ),
    );
  }