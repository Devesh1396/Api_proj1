import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final productProvider = Provider.of<ProductProvider>(context, listen: false);
      productProvider.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Products', style: TextStyle(color: Colors.white),),
      ),
      body: productProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : productProvider.errorMessage != null
          ? Center(child: Text('Error: ${productProvider.errorMessage}'))
          : ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return ListTile(
            leading: Image.network(product.thumbnail, width: 50, height: 50),
            title: Text(product.title),
            subtitle: Text('\$${product.price}'),
            onTap: () {
              // Handle product click
            },
          );
        },
      ),
    );
  }
}
