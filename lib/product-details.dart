import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_up_shoes/shoe.dart';

class ProductDetailsPage extends StatelessWidget {
  final Shoe shoe;

  ProductDetailsPage({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              shoe.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              '${shoe.name} - \$${shoe.price.toString()}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(shoe.description),
          ],
        ),
      ),
    );
  }
}