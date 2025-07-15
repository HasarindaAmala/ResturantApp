part of 'menu_item_bloc.dart';

@immutable
sealed class MenuItemEvent {}

class IngredientsButtonClickedEvent extends MenuItemEvent{}
class NutritionalButtonClickedEvent extends MenuItemEvent{}
class InstructionButtonClickedEvent extends MenuItemEvent{}
class AllergiesButtonClickedEvent extends MenuItemEvent{}
class CountUpClickedEvent extends MenuItemEvent{


}
class CountDownClickedEvent extends MenuItemEvent{

}