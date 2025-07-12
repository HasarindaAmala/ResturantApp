import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_interview/fetures/Menu/bloc/menu_bloc.dart';

import 'menu_tile_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MenuBloc menuBloc = MenuBloc();
  @override
  void initState() {
    // TODO: implement initState
    print("menu screen");
    menuBloc.add(MenuInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<MenuBloc, MenuState>(
      bloc: menuBloc,
      listenWhen: (previous, current) => current is MenuActionState,
      buildWhen: (previous, current) => current is! MenuActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is MenuLoadingSuccessState) {
          final MenuSuccessState = state;
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
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
                    // Padding(
                    //   padding:  EdgeInsets.only(left: width*0.3,top: height*0.2),
                    //   child: Container(
                    //     width: width*0.4,
                    //     height: height*0.07,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.7,
                  color: Colors.black,
                  child: ListView.builder(
                    itemCount: MenuSuccessState.menu.length,
                    itemBuilder: (context, index) {
                      return MenuTileWidget(
                        menuDataModel: MenuSuccessState.menu[index],
                      );
                    },
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
