import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/MenuData.dart';
import '../models/Menu_data_model.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<MenuInitialEvent>(homeInitialEvent);
    on<MenuClickedEvent>(menuClickedEvent);
  }

  FutureOr<void> homeInitialEvent(MenuInitialEvent event, Emitter<MenuState> emit) {
    emit(MenuLoadingSuccessState(
        menu: MenuData.menuData.map(
            (e)=> MenuDataModel(
              Id: e['ID'],
              MenuId: e['MenuId'],
              VerticalId: e['VerticalId'],
              StoreId: e['StoreId'],
              Title: e['Title']['en'],
              SubTitle: e['SubTitle'],
              Description: e['Description'],
              CategoryId: e['MenuCategoryIDs']
            ),
        ).toList(),

    ));
  }

  FutureOr<void> menuClickedEvent(MenuClickedEvent event, Emitter<MenuState> emit) {
    emit(MenuNavigateToCategoryActionState());
  }
}
