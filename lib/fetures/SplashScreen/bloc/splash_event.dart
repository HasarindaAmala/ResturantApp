part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

abstract class SplashActionEvent extends SplashEvent{

}
class SplashInitialEvent extends SplashEvent{

}

class LoadingAnimationDoneActionEvent extends SplashActionEvent{

}
