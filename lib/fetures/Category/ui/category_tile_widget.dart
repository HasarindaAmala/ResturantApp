import 'package:flutter/material.dart';
import 'package:test_project_interview/data/MenuItemData.dart';
import 'package:test_project_interview/fetures/Category/models/Category_data_model.dart';


class CategoryTileWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  const CategoryTileWidget({super.key,required this.item});




  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.09),
      child: Container(
        height: MediaQuery.of(context).size.height*0.15,
        decoration: BoxDecoration(
          //image: DecorationImage(image: AssetImage("asserts/MenuCover.png"),opacity: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
          border: Border(bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.6)),

          ),
        ),
        margin: const EdgeInsets.only(left: 10,right: 10,bottom: 7),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                      child: Image(image: NetworkImage("https://images.newscientist.com/wp-content/uploads/2025/05/23145109/SEI_252766900.jpg"),fit: BoxFit.cover,))),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item["Title"]["en"],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item["Description"]["en"],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      "RS: ${item["PriceInfo"]["Price"]["PickupPrice"]} .00",
                      style: TextStyle(
                        color: Color(0xFF1CAE81),
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
