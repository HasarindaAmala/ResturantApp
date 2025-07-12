import 'package:flutter/material.dart';
import 'package:test_project_interview/fetures/Menu/models/Menu_data_model.dart';

class MenuTileWidget extends StatelessWidget {
  final MenuDataModel menuDataModel;
  const MenuTileWidget({super.key,required this.menuDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("asserts/menuCover.png"),opacity: 0.5),
        color: Color(0xFF1CAE81),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 7),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.fastfood_outlined,color: Colors.white,),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(menuDataModel.Title,style: TextStyle(color: Colors.white,fontSize: 18.0),),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
