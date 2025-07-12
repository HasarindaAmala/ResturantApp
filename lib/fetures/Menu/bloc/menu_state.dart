part of 'menu_bloc.dart';

@immutable
sealed class MenuState {}

abstract class MenuActionState extends MenuState {}

class MenuInitial extends MenuState {}

class MenuLoadingSuccessState extends MenuState {
  final List<MenuDataModel> menu;
  MenuLoadingSuccessState({required this.menu});
}

class MenuNavigateToCategoryActionState extends MenuActionState {}
