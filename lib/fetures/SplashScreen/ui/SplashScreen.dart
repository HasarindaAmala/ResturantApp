import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';

import '../../Menu/ui/MenuScreen.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with  TickerProviderStateMixin{
  late final GifController AnimationController;
  final SplashBloc splashBloc = SplashBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    splashBloc.add(SplashInitialEvent());
    AnimationController = GifController(vsync: this);
    AnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("GIF animation done");
        splashBloc.add(LoadingAnimationDoneActionEvent());
        // 👉 do your action here, like navigation or state change
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        bloc: splashBloc,
        listenWhen: (previous,current) => current is SplashActionState,
        buildWhen: (previous,current) => current is !SplashActionState,
        listener: (context, state) {
          if(state is SplashScreenDoneState){
            print("navigation starts");
            Navigator.push(context,MaterialPageRoute(builder: (context) => MenuPage()));
          }
    // TODO: implement listener
  },
  builder: (context, state) {
          switch(state.runtimeType){
            case SplashLoadingState:
              return Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Gif(
                      autostart: Autostart.once,
                      controller: AnimationController,
                      image: AssetImage("asserts/foodAnimation.gif"),
                      onFetchCompleted: (){

                      },
                    ),
                  ),
                ),
              );

            default:
              return SizedBox();
          }

  },
),
    );
  }
}
