part of 'menu_bloc.dart';

@immutable
sealed class MenuEvent {}

class MenuInitialEvent extends MenuEvent{

}

class MenuClickedEvent extends MenuEvent{}