part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CategoryInitialEvent extends CategoryEvent{}

class CategoryTileClickedActionEvent extends CategoryEvent{}