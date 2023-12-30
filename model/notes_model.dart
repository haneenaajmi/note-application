// import 'package:hive/hive.dart';
// part 'notes_model.g.dart';

class NotesModel {
  final String title;

  final String description;

  final String? date;

   int? color;

  // constructor, named parameter

  NotesModel({
    required this.title,
    required this.description,
     this.date,
     this.color,
  });
}
