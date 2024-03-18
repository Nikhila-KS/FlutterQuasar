import 'package:flutter/material.dart';

enum Categories{  // enum is used to create a list of constants,, enum and list are different in the sense that enum is a constant list but list is not a constant list
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  final String title;
  final Color color;

  const Category(this.title, this.color);
}