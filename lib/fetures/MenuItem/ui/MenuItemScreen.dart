import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_interview/fetures/MenuItem/bloc/menu_item_bloc.dart';

class MenuItem extends StatefulWidget {
  final Map<String, dynamic> item;
  const MenuItem({super.key, required this.item});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  MenuItemBloc menuItemBloc = MenuItemBloc();
  late bool IngredientButtonClicked ;
  late bool NutritionalButtonClicked ;
  late bool InstructionsButtonClicked ;
  late bool AlergiesButtonClicked ;
  late List ingredients;
  late List modificationIds;
  late int itemCount;
  late int totalAmount;


  bool isIngredient = false;
  bool isNutritional = false;
  bool isInstruction = false;
  bool isAllergy = false;


  @override
  void initState() {
    // TODO: implement initState
    menuItemBloc.add(IngredientsButtonClickedEvent());
    ingredients = widget.item["DishInfo"]["Classifications"]["Ingredients"];
    modificationIds = widget.item["ModifierGroupRules"]["IDs"];
    itemCount = 1;
    totalAmount = (widget.item["PriceInfo"]["Price"]["PickupPrice"] as int);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<MenuItemBloc, MenuItemState>(
      bloc: menuItemBloc,
      listenWhen: (previous, current) => current is MenuActionState,
      buildWhen: (previous, current) => current is! MenuActionState,
      listener: (context, state) {

      },
  builder: (context, state) {
    if (state is TabSelectionState) {
      isIngredient = state.ingredient;
      isNutritional = state.nutritional;
      isInstruction = state.instruction;
      isAllergy = state.allergies;
    }
    if (state is CountUpClickedState) {
       itemCount++;
       totalAmount = totalAmount + (widget.item["PriceInfo"]["Price"]["PickupPrice"] as int);

    }
    if(state is CountDownClickedState){
      if (itemCount > 1) {
        itemCount--;
        totalAmount = totalAmount - (widget.item["PriceInfo"]["Price"]["PickupPrice"] as int);
      }
    }


    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(image: AssetImage("asserts/foodItem.png")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.item["Title"]["en"],
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "Rs: ${widget.item["PriceInfo"]["Price"]["PickupPrice"]}.00",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_outlined, color: Color(0xFF1CAE81)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Color(0xFF1CAE81)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "5.0",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 10.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Text("${widget.item["Description"]["en"]}",maxLines: 3,textAlign: TextAlign.start,style: TextStyle(fontSize: 14.0),),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [

                          GestureDetector(
                            onTap: (){
                              menuItemBloc.add(IngredientsButtonClickedEvent());
                            },
                            child: Container(
                              width: width*0.3,
                              decoration: BoxDecoration(

                                border: Border(bottom: isIngredient == true? BorderSide(color: Color(0xFF1CAE81),width: 2.0):BorderSide(color: Colors.grey)),

                              ),
                              child: Center(child: Text("Ingredients")),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              menuItemBloc.add(NutritionalButtonClickedEvent());
                            },
                            child: Container(
                              width: width*0.3,
                              decoration: BoxDecoration(

                                border: Border(bottom: isNutritional  == true? BorderSide(color: Color(0xFF1CAE81),width: 2.0):BorderSide(color: Colors.grey)),

                              ),
                              child: Center(child: Text("Nutritional")),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              menuItemBloc.add(InstructionButtonClickedEvent());
                            },
                            child: Container(
                              width: width*0.3,
                              decoration: BoxDecoration(

                                border: Border(bottom: isInstruction == true? BorderSide(color: Color(0xFF1CAE81),width: 2.0):BorderSide(color: Colors.grey)),

                              ),
                              child: Center(child: Text("Instructions")),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              menuItemBloc.add(AllergiesButtonClickedEvent());
                            },
                            child: Container(
                              width: width*0.3,
                              decoration: BoxDecoration(

                                border: Border(bottom: isAllergy == true? BorderSide(color: Color(0xFF1CAE81),width: 2.0):BorderSide(color: Colors.grey)),

                              ),
                              child: Center(child: Text("Allergies")),
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                  isIngredient ?
                  Container(
                    width: width,
                    height: height*0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.0,),
                          Text("This product contains ingredients that may trigger allergies. Please review the ingredient list for details",maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                          ingredients.isNotEmpty ?
                          Text("${(widget.item["DishInfo"]["Classifications"]["Ingredients"])}"):
                          SizedBox(height: 10.0,),
                          Text("Ingredients are not Available.."),
                        ],
                      ),
                    ),

                  ): isNutritional ? Container(
                    width: width,
                    height: height*0.2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0,top: 20,right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nutritional value per 100g",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("198",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Kcal",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("14.1",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Protein",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("19.6",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Fats",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("6.6",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Carbo H",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ): isInstruction ? Container(
                    width: width,
                    height: height*0.2,

                    child: Center(child: Text("Not Available")),

                  ):Container(
                    width: width,
                    height: height*0.2,
                    child: Center(child: Text("Not Available")),

                  ),
              Container(
                width: width,
                height: height*0.4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      modificationIds.isNotEmpty ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Comments (Optional)",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: width * 0.95,
                            child: TextField(
                              maxLines: null, // Allow dynamic height if needed
                              minLines: 5,    // Show 5 lines initially
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                hintText: 'Write your comment here...',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                filled: true,
                                fillColor: Colors.grey[100],
                                contentPadding: EdgeInsets.all(15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Color(0xFF1CAE81), width: 2.0),
                                ),
                              ),
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus(); // Dismiss keyboard on outside tap
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          SizedBox(
                            width: width*0.95,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width*0.3,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withValues(alpha: 0.7),
                                    borderRadius: BorderRadius.circular(10.0),

                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(onPressed: (){
                                        menuItemBloc.add(CountDownClickedEvent());
                                      }, icon: Icon(Icons.remove)),
                                      Text(itemCount.toString()),
                                      IconButton(onPressed: (){
                                        menuItemBloc.add(CountUpClickedEvent());
                                      }, icon: Icon(Icons.add)),

                                    ],
                                  ),
                                ),
                                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF1CAE81),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ), child: Text("Add to cart  Rs ${totalAmount}"),),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0,),
                        ],
                      ): Text(modificationIds.toString()),
                    ],
                  ),
                ),
              ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  },
);
  }
}
