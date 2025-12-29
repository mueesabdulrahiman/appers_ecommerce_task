import 'package:appers_ecommerce_app/providers/product_provider.dart';
import 'package:appers_ecommerce_app/theme/app_colors.dart';
import 'package:appers_ecommerce_app/widgets/home_banner.dart';
import 'package:appers_ecommerce_app/widgets/product_grid.dart';
import 'package:appers_ecommerce_app/widgets/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Scaffold(
      body: SafeArea(
        child: productProvider.loading
            ? const HomeShimmer(key: ValueKey('shimmer'))
            : SingleChildScrollView(
                //  padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //header section
                    _buildHeader(),
        
                    const SizedBox(height: 10),
        
                    //banner section
                    HomeBanner(),
        
                    const SizedBox(height: 10),
        
                    // categories section
                    __buildCategoryRow(),
        
                    const SizedBox(height: 2),
        
                    //products section
                    ProductGrid(products: productProvider.filteredProducts),
                  ],
                ),
              ),
      ),
    );
  }

  // header Widget

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome Back 👋',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          CircleAvatar(radius: 18),
        ],
      ),
    );
  }

  // categories widget

  Widget __buildCategoryRow() {
    final categories = [
      'All',
      'Men\'s Clothing',
      'Women\'s Clothing',
      'Jewelery',
      'Electronics',
    ];
    final productProvider = context.watch<ProductProvider>();

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<ProductProvider>().selectCategory(categories[index]);
            },
            child: Chip(
              shape: StadiumBorder(),
              label: Text(categories[index]),
              backgroundColor:
                  productProvider.selectedCategory == categories[index]
                  ? Theme.of(context).primaryColor
                  : AppColors.card,
              labelStyle: TextStyle(
                color: productProvider.selectedCategory == categories[index]
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: categories.length,
      ),
    );
  }
}
