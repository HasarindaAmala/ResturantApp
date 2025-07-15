part of 'menu_item_bloc.dart';

@immutable
sealed class MenuItemState {}
abstract class MenuActionState extends MenuItemState{}
final class MenuItemInitial extends MenuItemState {}

class TabSelectionState extends MenuItemState{
  final bool ingredient;
  final bool nutritional;
  final bool instruction;
  final bool allergies;
  TabSelectionState({
    required this.ingredient,
    required this.nutritional,
    required this.instruction,
    required this.allergies,
});
}

class CountUpClickedState extends MenuItemState{}
class CountDownClickedState extends MenuItemState{}