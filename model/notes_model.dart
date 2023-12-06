class NotesModel {
  String title;
  String description;
  String? date;
  // constructor, named parameter
  NotesModel({
    required this.title,
    required this.description,
    this.date,
  });
}
