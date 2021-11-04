import 'package:flutter/material.dart';

void main() => runApp(MaterialApp (
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.cyan
    ),
    home: MyApp(),
));

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<MyApp> {
  
  late String studentName, studentID, studyProgramID;
  late double studentGrade;

  getStudentName(name){
    this.studentName = name;
  }

 getStudentID(id){
   this.studentID = id;
 } 

  getStudyProgramID(programID){
    this.studyProgramID = programID;
  }

getStudentGrade(grade){
  this.studentGrade = double.parse(grade);
}



  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CRUD App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                      )
                    )
                    
                    ),
                    onChanged: (String name){
                        getStudentName(name);
                    },
                ),
              ),

                Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                      )
                    )
                    
                    ),
                    onChanged: (String id){
                      getStudentID(id);
                    },
                ),
              ),

                Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Program ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                      )
                    )
                    
                    ),
                    onChanged: (String programID){
                      getStudyProgramID(programID);
                    },
                ),
              ),

                Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Grade",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                      )
                    )
                    
                    ),
                    onChanged: (String grade){
                        getStudentGrade(grade);
                    },
                ),
              )
            ],
            ),
        ),
    );
  }
}