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
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.0),
              Container(
                width: 350.0,
                height: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    shoe.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '${shoe.name}',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 8.0),
              Text(
                '\$${shoe.price.toString()}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  shoe.description,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the CheckoutPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                child: Text("Proceed to Checkout", style: TextStyle(fontSize: 18.0, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
