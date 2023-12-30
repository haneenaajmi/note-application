import 'package:flutter/material.dart';

import '../../../model/notes_model.dart';
import '../../../utils/color_constants/color_constants.dart';

class ListScreenWidget extends StatefulWidget {
  ListScreenWidget(
      {super.key,
      required this.title,
      required this.discription,
      required this.date,
      required this.color,
      required Null Function() onDeleteTap});
  String title;
  String discription;
  String? date;
  int? color;

  @override
  State<ListScreenWidget> createState() => _ListScreenWidgetState();
}

class _ListScreenWidgetState extends State<ListScreenWidget> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  List<NotesModel> myNotesList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //  color: ColorConstant.mycolorList[index],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(children: [
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: ColorConstant.background,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  labelText: "Title",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  labelText: "Description",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorConstant.appbar)),
                                onPressed: () {
                                  myNotesList.add(NotesModel(
                                      title: nameController.text,
                                      description: descriptionController.text));
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: Text("Update"))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: 10),
              InkWell(
                  child: Icon(Icons.delete),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Do you want to delete this note?",
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ])
          ]),
          Text(
            widget.discription,
            textAlign: TextAlign.justify,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
