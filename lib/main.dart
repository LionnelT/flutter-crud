import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


runApp(MaterialApp (
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.cyan
    ),
    home: MyApp(),
));
}

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

createData(){
  print("created");

  DocumentReference documentReference = 
  FirebaseFirestore.instance.collection("MyStudents").
  doc(studentName);

  //Map

  Map<String, dynamic> students = {
    "studentName": studentName,
    "studentID": studentID,
    "studyProgramID": studyProgramID,
    "studentGrade": studentGrade,
  };


  documentReference.set(students).whenComplete(() {
          print("$studentName created");
  });

}

readData(){
  DocumentReference documentReference = 
  FirebaseFirestore.instance.collection("MyStudents").
  doc(studentName);

documentReference.get().then((datasnapshot) {
    // ignore: avoid_print
    print(datasnapshot.data()["studentName"]);
    print(datasnapshot.data()["studentID"]);
    print(datasnapshot.data()["studyProgramID"]);
    print(datasnapshot.data()["studentGrade"]);
});

}

updateData(){
  print("updated");
}

deleteData(){
  print("deleted");
}

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CRUD App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: 1.0,
                  top: 0.0
                  ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text("Create"),
                      textColor: Colors.white,
                      onPressed: (){
                          createData();
                      }
                    ),
                    RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text("Read"),
                      textColor: Colors.white,
                      onPressed: (){
                          readData();
                      }
                    ),
                    RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text("Update"),
                      textColor: Colors.white,
                      onPressed: (){
                          updateData();
                      }
                    ),
                    RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text("Delete"),
                      textColor: Colors.white,
                      onPressed: (){
                          deleteData();
                      }
                    )
                ],
                )
            ],
            ),
        ),
    );
  }
}