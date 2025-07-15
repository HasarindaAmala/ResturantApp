part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

abstract class CategoryAction extends CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingSuccessState extends CategoryState{
  final List<CategoryDataModel> categoryDataModel;
  CategoryLoadingSuccessState( {
    required this.categoryDataModel,
});
}

final class CategoryTileClickedActionState extends CategoryAction{}

