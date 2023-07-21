import  'package:uuid/uuid.dart';

const uuid = Uuid();  // check documentation for uuid package
class Place{
  Place({required this.title}): id =uuid.v4();
  final String id;
  final String title;
}