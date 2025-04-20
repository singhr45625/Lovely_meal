import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lovelymeal/models/cart_controller.dart';
import 'package:lovelymeal/models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final cartItems = cartController.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          Product product = cartItems[index];
          return ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(product.title),
            subtitle: Text("₹${product.price}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                cartController.removeFromCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product.title} removed from cart!")),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total: ₹${cartController.totalPrice}"),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Proceed to Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}