import 'package:flutter/material.dart';
import 'package:step_up_shoes/shoe.dart';
import 'checkout.dart';

class ProductDetails extends StatelessWidget {
  final Shoe shoe;

  ProductDetails({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name),
      ),
      body: SingleChildScrollView(
        child: Center(
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the CheckoutPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                child: Text("Proceed to Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}