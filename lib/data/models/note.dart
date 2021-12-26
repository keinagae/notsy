import 'dart:ui';

import 'package:notsy/data/models/category.dart';

class Note{
  String title;
  String description;
  List<Category> categories;
  Color color;
  DateTime dateTime;
  bool isNew;
  Note({required this.title,required this.description,this.categories=const [],required this.color,required this.dateTime,this.isNew=false});
}