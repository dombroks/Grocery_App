import 'package:flutter/material.dart';
import 'package:grocery_app/Model/element.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/category.dart';
import 'package:grocery_app/components/vegetaleAndFruit.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  List<IconData> iconsList = [
    Icons.home,
    Icons.shopping_cart,
    Icons.local_drink,
    Icons.home
  ];
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);
    final fruits = provider.fruits;
    final vegetables = provider.vegetables;

    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "All Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      category(
                        title: "Household",
                        icon: Icons.home,
                      ),
                      category(
                        title: "Vegetables",
                        icon: Icons.category,
                      ),
                      category(
                        title: "Drinks",
                        icon: Icons.local_drink,
                      ),
                      category(
                        title: "Pharmacy",
                        icon: Icons.local_pharmacy,
                      ),
                      category(
                        title: "Frozen Food",
                        icon: Icons.home,
                      ),
                      category(
                        title: "Fruits",
                        icon: Icons.home,
                      ),
                      category(
                        title: "Fish",
                        icon: Icons.home,
                      ),
                      category(
                        title: "Meat",
                        icon: Icons.home,
                      ),
                      category(
                        title: "Chicken",
                        icon: Icons.home,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Fruits",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17),
                ),
                //  Text("View all >")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: double.infinity,
              child: (fruits.length == 0)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: fruits.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        element e = fruits[index];

                        return VegetaleAndFruit(
                          vegetaleOrFruitName: e.name,
                          price: e.price,
                          amount: e.amount,
                          imageUrl: e.image,
                          addToCart: () {
                            provider.addElementToCart(e);
                          },
                          removeFromCart: () {
                            provider.romeveElementFromCart(e);
                          },
                        );
                      }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Vegetables",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17),
                ),
                //  Text("View all >")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: vegetables.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    
                    element e = vegetables[index];

                    return (vegetables.length == 0)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : VegetaleAndFruit(
                            vegetaleOrFruitName: e.name,
                            price: e.price,
                            amount: e.amount,
                            imageUrl: e.image,
                            addToCart: () {
                              provider.addElementToCart(e);
                            },
                            removeFromCart: () {
                              provider.romeveElementFromCart(e);
                            },
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
