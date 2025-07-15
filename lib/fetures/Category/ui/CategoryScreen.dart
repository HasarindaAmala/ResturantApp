import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/MenuItemData.dart';
import '../../MenuItem/ui/MenuItemScreen.dart';
import '../bloc/category_bloc.dart';
import 'category_tile_widget.dart';

class Category extends StatefulWidget {
  final String menuName;
  final String menuID;

  const Category({super.key, required this.menuName, required this.menuID});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  CategoryBloc categoryBlock = CategoryBloc();

  late Map<String,dynamic> itemDetails;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.menuID);
    categoryBlock.add(CategoryInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<CategoryBloc, CategoryState>(
      bloc: categoryBlock,
      listenWhen: (previous, current) => current is CategoryAction,
      buildWhen: (previous, current) => current is! CategoryAction,
      listener: (context, state) {
        if(state is CategoryTileClickedActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuItem(item: itemDetails,)));
        }
      },
      builder: (context, state) {
        if (state is CategoryLoadingSuccessState) {
          final filteredList =
              state.categoryDataModel
                  .where((item) => item.menuCategoryID == widget.menuID)
                  .toList();

          print(filteredList[0].menuEntities);
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.3,

                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage("asserts/shop.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "El Cabanyal",
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "FASTFOOD BURGERS",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image(
                                image: AssetImage("asserts/RoundLogo.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.7,
                      width: double.maxFinite,
                      color: Colors.white,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 40.0,
                                left: width * 0.05,
                              ),
                              child: Container(
                                width: width * 0.4,
                                height: height * 0.05,

                                decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.menuName),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: width,
                                height: height * 0.55,
                                child: ListView.builder(
                                  itemCount:
                                      filteredList[0].menuEntities.length,
                                  itemBuilder: (context, index) {
                                    final entityID =
                                        filteredList[0]
                                            .menuEntities[index]["ID"];
                                    final item = MenuItemsData.menuItemsData
                                        .firstWhere(
                                          (data) =>
                                              data["MenuItemID"] == entityID,
                                        );

                                    return GestureDetector(
                                      onTap: (){
                                        itemDetails = item;
                                        categoryBlock.add(CategoryTileClickedActionEvent());

                                      },
                                      child: CategoryTileWidget(item: item),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.506,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                  (width * 0.5) / 3,
                                  height * 0.05,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.delivery_dining_outlined,
                                color: Colors.black,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                  (width * 0.5) / 3,
                                  height * 0.05,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              child: Icon(
                                Icons.food_bank_outlined,
                                color: Colors.black,
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                  (width * 0.5) / 3,
                                  height * 0.05,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
