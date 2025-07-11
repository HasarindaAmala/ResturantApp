part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}
abstract class SplashActionState extends SplashState{

}

final class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState{}

class SplashLoadingSuccessState extends SplashState{
}

class SplashScreenDoneState extends SplashActionState{

}