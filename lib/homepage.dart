

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numberController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();
  TextEditingController titleController = new TextEditingController();
  TextEditingController authorController = new TextEditingController();
  TextEditingController levelController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  TextEditingController publisherController = new TextEditingController();
  TextEditingController isbnController = new TextEditingController();
  int bookCount = 0;
  String currentPath;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentPath = path.current;

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
        appBar: AppBar(
          title: Text("Ghana Registered Books - batch three entry"),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("Number of books entered: $bookCount. Thank you so much. \n Signed: Kweku Acquaye"),
              Text("File is stored here : $currentPath"),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "S/n",
                  hintText: "Eg: 1",
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                ),
                controller: numberController,
              ),

              TextFormField(
                controller: subjectController,
                decoration: InputDecoration(
                    labelText: "Subject",
                    hintText: "Eg: Science",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),

              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText : "Title of Book",
                labelText : "Title",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),

              TextFormField(
                controller: isbnController,
                decoration: InputDecoration(
                    labelText : "ISBN",
                hintText : "isbn",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),

              TextFormField(
                controller: levelController,
                decoration: InputDecoration(
                    labelText : "Level",
                    hintText : "Level",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),

              TextFormField(
                controller: typeController,
                decoration: InputDecoration(
                    labelText : "Book Type",
                    hintText: "Book type",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),


              TextFormField(
                controller: publisherController,
                decoration: InputDecoration(
                    hintText: "Publisher name",
                    labelText: "Publisher",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),

              TextFormField(
                controller: authorController,
                decoration: InputDecoration(
                    labelText : "Author (If more than one separate with a comma ',' )",
                hintText : "Author name",
                    fillColor: Colors.black,
                    focusColor: Colors.black
                ),

              ),


              ElevatedButton.icon(
                  onPressed: () async{
                    Map<String, String> map = {
                    "\n\ts/n" : numberController.text,
                    "\n\tsubject" :subjectController.text,
                    "\n\ttitle" : titleController.text,
                    "\n\tlevel" : levelController.text,
                    "\n\ttype" : typeController.text,
                    "\n\tpubisher" : publisherController.text,
                    "\n\tisbn" : isbnController.text,
                    "\n\tauthor": authorController.text
                    };


                    Map<String, dynamic> finalMap = {
                      map["s/n"] : map
                    };



                    File file = new File("F:\\Projects\\Ghana registered books.txt");

                    file.writeAsString("\n${finalMap.toString()}", mode: FileMode.append);
                    // file.create();

                    setState(() {
                      bookCount++;
                    });


                    numberController.clear();
                     subjectController.clear();
                     titleController.clear();
                     levelController.clear();
                     typeController.clear();
                     publisherController.clear();
                     isbnController.clear();
                    authorController.clear();
                    },
                  icon: Icon(Icons.save),
                  label: Text("Save entry")
              )
            ],
          ),
        ),
      ),
    );
  }
}
