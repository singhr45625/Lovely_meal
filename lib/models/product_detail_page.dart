import 'package:flutter/material.dart';
import 'package:lovelymeal/models/product.dart';
import 'package:lovelymeal/widgets/Big_text.dart';
import 'package:lovelymeal/widgets/small_text.dart';
import 'package:lovelymeal/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:lovelymeal/models/cart_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: AppColors.mainColor,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              product.imagePath,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: product.title),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.mainColor),
                      SizedBox(width: 5),
                      SmallText(text: "${product.rating} (${product.comments} reviews)"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 5),
                      SmallText(text: product.distance),
                      SizedBox(width: 20),
                      Icon(Icons.access_time, color: Colors.orange),
                      SizedBox(width: 5),
                      SmallText(text: product.time),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.red),
                      SizedBox(width: 5),
                      SmallText(text: "${product.calories} kcal"),
                      SizedBox(width: 20),
                      Icon(Icons.monetization_on, color: Colors.green),
                      SizedBox(width: 5),
                      SmallText(text: "₹${product.price}"),
                    ],
                  ),
                  SizedBox(height: 20),
                  BigText(text: "Description"),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(text: "₹${product.price}", color: AppColors.mainColor),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
              onPressed: () {
                print("Add to cart button tapped for: ${product.title}");
                final cartController = Provider.of<CartController>(context, listen: false);
                print("CartController instance in ProductDetailPage: $cartController");
                cartController.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product.title} added to cart!")),
                );
              },
              icon: Icon(Icons.shopping_cart),
              label: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}