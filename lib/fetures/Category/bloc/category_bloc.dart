import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/CategoryData.dart';
import '../models/Category_data_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryInitialEvent>(categoryInitialEvent);
    on<CategoryTileClickedActionEvent>(categoryTileClickedActionEvent);
  }

  FutureOr<void> categoryInitialEvent(
    CategoryInitialEvent event,
    Emitter<CategoryState> emit,
  ) {
    emit(
      CategoryLoadingSuccessState(
        categoryDataModel:
            CategoryData.categoryData
                .map(
                  (e) => CategoryDataModel(
                    id: e['ID'],
                    menuCategoryID: e["MenuCategoryID"],
                    menuEntities: e["MenuEntities"],
                  ),
                )
                .toList(),
      ),
    );
  }

  FutureOr<void> categoryTileClickedActionEvent(CategoryTileClickedActionEvent event, Emitter<CategoryState> emit) {
    emit(CategoryTileClickedActionState());
  }
}
