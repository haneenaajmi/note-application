// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/utils/color_constants/color_constants.dart';
import 'package:note_app/view/home_screen/widgets/noteslist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int? selectedIndex;

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();

  List<NotesModel> myNotesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background,
      appBar: AppBar(
        backgroundColor: ColorConstant.appbar,
        title: Text("Note App", style: TextStyle(color: ColorConstant.text)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: myNotesList.length,
          itemBuilder: (context, index) => ListScreenWidget(
            title: myNotesList[index].title,
            discription: myNotesList[index].description,
            date: myNotesList[index].date,
            color: myNotesList[index].color,
            onDeleteTap: () {
              // myNotesList.removeAt(index);
              myNotesList[index] = NotesModel(
                title: "title",
                description: "description",
              );
              setState(() {});
            },
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.appbar,
        onPressed: () {
          bottonSheetRefactor(context);
        },
        child: Icon(Icons.add, color: Color(0xff374151)),
      ),
    );
  }

  Future<dynamic> bottonSheetRefactor(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, inSetState) {
            return Container(
              color: ColorConstant.background,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Title",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Discription",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: "Date",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ColorConstant.mycolorList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 4,
                                    color: selectedIndex == index
                                        ? ColorConstant.mycolorListDart[index]
                                        : Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.mycolorList[index],
                                ),
                                height: 50,
                                width: 50,
                              ),
                              onTap: () {
                                inSetState(() {
                                  selectedIndex = index;
                                });
                                print(selectedIndex);
                              },
                            ),
                          ),
                        )),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorConstant.appbar),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorConstant.appbar)),
                          onPressed: () {
                            myNotesList.add(NotesModel(
                                title: nameController.text,
                                description: descriptionController.text,
                                date: dateController.text,
                                color: selectedIndex ?? 0));
                            print(myNotesList.length);
                            setState(() {});
                            nameController.clear();
                            descriptionController.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Save"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
