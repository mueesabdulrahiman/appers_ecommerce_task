import 'package:appers_ecommerce_app/providers/product_provider.dart';
import 'package:appers_ecommerce_app/providers/theme_provider.dart';
import 'package:appers_ecommerce_app/widgets/home_banner.dart';
import 'package:appers_ecommerce_app/widgets/home_category.dart';
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
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Back 👋',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: productProvider.loading
            ? const HomeShimmer(key: ValueKey('shimmer'))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //banner section
                    HomeBanner(),

                    const SizedBox(height: 5),

                    // categories section
                    buildCategoryRow(context),

                    //products section
                    ProductGrid(products: productProvider.filteredProducts),
                  ],
                ),
              ),
      ),
    );
  }
}
