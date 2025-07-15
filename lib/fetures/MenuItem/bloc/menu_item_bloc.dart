import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_item_event.dart';
part 'menu_item_state.dart';

class MenuItemBloc extends Bloc<MenuItemEvent, MenuItemState> {
  MenuItemBloc() : super(MenuItemInitial()) {
    on<IngredientsButtonClickedEvent>(ingredientsButtonClickedEvent);
    on<NutritionalButtonClickedEvent>(nutritionalButtonClickedEvent);
    on<InstructionButtonClickedEvent>(instructionButtonClickedEvent);
    on<AllergiesButtonClickedEvent>(allergiesButtonClickedEvent);
    on<CountUpClickedEvent>(countUpClickedEvent);
    on<CountDownClickedEvent>(countDownClickedEvent);
  }

  FutureOr<void> ingredientsButtonClickedEvent(IngredientsButtonClickedEvent event, Emitter<MenuItemState> emit) {
    emit(
        TabSelectionState(ingredient: true, nutritional: false, instruction: false, allergies: false)
    );

  }

  FutureOr<void> nutritionalButtonClickedEvent(NutritionalButtonClickedEvent event, Emitter<MenuItemState> emit) {
    emit(
        TabSelectionState(ingredient: false, nutritional: true, instruction: false, allergies: false)
    );
  }

  FutureOr<void> instructionButtonClickedEvent(InstructionButtonClickedEvent event, Emitter<MenuItemState> emit) {
    emit(
        TabSelectionState(ingredient: false, nutritional: false, instruction: true, allergies: false)
    );
  }

  FutureOr<void> allergiesButtonClickedEvent(AllergiesButtonClickedEvent event, Emitter<MenuItemState> emit) {
    emit(
        TabSelectionState(ingredient: false, nutritional: false, instruction: false, allergies: true)
    );
  }

  FutureOr<void> countUpClickedEvent(CountUpClickedEvent event, Emitter<MenuItemState> emit) {
    emit(
      CountUpClickedState()
    );
  }

  FutureOr<void> countDownClickedEvent(CountDownClickedEvent event, Emitter<MenuItemState> emit) {
    emit(
      CountDownClickedState()
    );
  }
}
