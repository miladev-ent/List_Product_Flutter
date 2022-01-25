// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const ListProduct());
}

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  String imageUrl =
      'https://static.iapps.ir/apps/file/image/c4d7ecf2-808b-4c8c-a24d-9751f1c5188b-d24b9f83-7363-41f0-82d7-264e1036fce7/250x250.jpg?key=Ndu5E2g4BVBJVAwsDk82jSeThSw6CcKq';
  List<String> category = ['All', 'Flutter', 'Laravel', 'Python', 'Vue'];
  int select = 0;
  List<Product> listProducts = [
    Product(
      price: "70",
      image:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000",
    ),
    Product(
      price: "578",
      image:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000",
    ),
    Product(
      price: "23",
      image:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000",
    ),
    Product(
      price: "500",
      image:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000",
    ),
    Product(
      price: "37",
      image:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1631220221000",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(imageUrl, width: 40),
                    Icon(CupertinoIcons.text_alignright)
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            select = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            category[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color:
                                  select == index ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: listProducts.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(listProducts[index].image),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ' + listProducts[index].price,
                                style: TextStyle(
                                  color: Color(0xff67a79c),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                CupertinoIcons.ellipsis,
                                size: 24,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Product {
  String price;
  String image;
  Product({required this.price, required this.image});
}
