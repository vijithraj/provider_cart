import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart/classpage.dart';
import 'package:provider_cart/providerclass.dart';

import 'cartpage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List icstore = [Namedicon(text: "", iconData: Icons.shopping_cart)];
  List store = [
    ListData(
        imagepath: "images/apple.jpeg",
        name: "Apple",
        unit: " unit:Kg",
        price: "Price:\$20"),
    ListData(
        imagepath: "images/mango.jpeg",
        name: "Mango",
        unit: "unit:Doz",
        price: "Price:\$30"),
    ListData(
        imagepath: "images/banana.jpeg",
        name: "Banana",
        unit: "unit:Doz",
        price: "Price:\$10"),
    ListData(
        imagepath: "images/grapes.jpeg",
        name: "Grapes",
        unit: "unit:Kg",
        price: "Price:\$8"),
    ListData(
        imagepath: "images/watermelon.jpeg",
        name: "WaterMelon",
        unit: "unit:Kg",
        price: "Price:\$25"),
    ListData(
        imagepath: "images/kiwi.jpeg",
        name: "Kiwi",
        unit: "unit:Pc",
        price: "Price:\$40"),
    ListData(
        imagepath: "images/apple.jpeg",
        name: "Orange",
        unit: "unit:Doz",
        price: "Price:\$15"),
    ListData(
        imagepath: "images/peach.jpeg",
        name: "Peach",
        unit: "unit:Kg",
        price: "Price:\$20"),
  ];

  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_class>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Product List",
            style: TextStyle(fontSize: 23, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: store.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.white10, blurRadius: 10)
                ]),
                child: Card(
                  color: Colors.white24,
                  child: ListTile(
                    title: Text(
                      store[index].name,
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            store[index].unit,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            store[index].price,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    leading: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(store[index].imagepath))),
                    ),
                    trailing: FloatingActionButton.extended(
                      onPressed: () {
                        object.favorites(
                            store[index].imagepath,
                            store[index].name,
                            store[index].unit,
                            store[index].price);
                      },
                      label: const Text('Add To Cart'),
                      backgroundColor: Colors.brown,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
