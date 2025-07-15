import 'dart:core';

class MenuDataModel{
  final String Id;
  final String? MenuId;
  final String? VerticalId;
  final String? StoreId;
  final String Title;
  final String? SubTitle;
  final String? Description;
  final List<String> CategoryId;
  MenuDataModel({
    required this.Id,
    required this.MenuId,
    required this.VerticalId,
    required this.StoreId,
    required this.Title,
    required this.SubTitle,
    required this.Description,
    required this.CategoryId,
});


}