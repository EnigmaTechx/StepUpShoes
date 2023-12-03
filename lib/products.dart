import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_up_shoes/shoe.dart';
import 'package:step_up_shoes/productDetails.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Step Up Shoe Store'),
        ),
        body: ShoeGrid(),
      ),
    );
  }
}


class ShoeGrid extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe(
      name: 'Addidas Pro X',
      size: 8,
      description: 'Comfortable and stylish shoes for daily use.',
      price: 49.99,
      image: 'images/addidas.jpg',
    ),
    Shoe(
      name: 'Asato Ultra',
      size: 5,
      description: 'Perfect for your sports and fitness activities.',
      price: 33.99,
      image: 'images/asato.jpg',
    ),
    Shoe(
      name: 'Magnus High Heels',
      size: 10,
      description: 'Great shoes for every woman.',
      price: 105.99,
      image: 'images/high-heels.jpg',
    ),
    Shoe(
      name: 'Air Jordans 12',
      size: 12,
      description: 'Newest edition of Nike shoes for the summer.',
      price: 230.99,
      image: 'images/jordans.jpg',
    ),
    Shoe(
      name: 'Lukas Bount',
      size: 14,
      description: 'Newest edition of Nike shoes for the summer.',
      price: 204.99,
      image: 'images/lukas.jpg',
    ),
    Shoe(
      name: 'Vans Zion',
      size: 8,
      description: 'Classic all-weather shoes',
      price: 100.99,
      image: 'images/vans.jpg',
    )

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,),
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        return ShoeCard(shoe: shoes[index]);
      },
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  ShoeCard({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              shoe.image,
              fit: BoxFit.cover,
              height: 300.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${shoe.price.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetails(shoe: shoe)),
                    );
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

