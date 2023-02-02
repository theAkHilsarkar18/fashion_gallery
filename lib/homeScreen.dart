import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List productList = [
    "SHOES",
    "T-SHIRT",
    "TOP",
    "BLAZER",
    "HOODIE",
    "JEANS",
    "COMBO",
    "JACKET",
    "SHRUG",
    "HOT WEAR",
    "WATCH",
    "SHIRT"
  ];
  List productPrice = [
    "30.33",
    "52.00",
    "40.00",
    "99.99",
    "70.00",
    "72.30",
    "56.27",
    "60.90",
    "90.99",
    "45.90",
    "99.99",
    "25.33",
  ];

  List productRating = [
    "5.0",
    "4.5",
    "4.2",
    "4.7",
    "4.3",
    "4.0",
    "4.1",
    "4.4",
    "4.9",
    "4.8",
    "4.2",
    "4.0",
  ];

  List productImg = [
    "assets/images/11.png",
    "assets/images/4.jpg",
    "assets/images/6.jpg",
    "assets/images/7.jpg",
    "assets/images/3.jpg",
    "assets/images/5.jpg",
    "assets/images/10.jpg",
    "assets/images/9.jpg",
    "assets/images/13.jpg",
    "assets/images/12.jpg",
    "assets/images/8.jpg",
    "assets/images/1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(transform: GradientRotation(1), colors: [
                Colors.blue,
                Colors.blue.shade900,
                Colors.deepPurple.shade700,
              ],),),
            ),
            GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => boxUi(productList[index],productPrice[index],productImg[index],productRating[index]),
              itemCount: productList.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget boxUi(String productName,String productPrice,String imgPath,String rating) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("${imgPath}",
              fit: BoxFit.fill,
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 20,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10),),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${rating}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 2,),
                    Icon(Icons.star,color: Colors.white,size: 8,)
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
                  color: Colors.black54,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("$productName",style: TextStyle(color: Colors.white,fontSize: 12,letterSpacing: 1),),
                    Text("\$ $productPrice",style: TextStyle(color: Colors.white,fontSize: 12,letterSpacing: 1),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
