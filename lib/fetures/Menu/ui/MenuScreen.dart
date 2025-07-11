import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    // TODO: implement initState
    print("menu screen");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height*0.3,
            
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(image: AssetImage("asserts/shop.png"),fit: BoxFit.cover),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("El Cabanyal",style: TextStyle(fontSize: 35.0,color: Colors.white),),
                      Text("FASTFOOD BURGERS",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w300),),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                      height: 70,
                      child: Image(image: AssetImage("asserts/RoundLogo.png"),)),
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: height*0.6,
            color: Colors.amber,
          )
        ],
      ),

    );
  }
}
