import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivva/view.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentsDir = await getApplicationDocumentsDirectory(); //3rd
  Hive.init(appDocumentsDir.path); //2nd
  var box = await Hive.openBox('testBox'); //1st

  runApp(MaterialApp(
    home: Hiva_demo(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.pink)),
  ));
}

class Hiva_demo extends StatefulWidget {
  const Hiva_demo({Key? key}) : super(key: key);

  @override
  State<Hiva_demo> createState() => _Hiva_demoState();
}

class _Hiva_demoState extends State<Hiva_demo> {
  int a = 0;
  String name = "";
  Box box = Hive.box("testBox"); //4th

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    a = box.get("levalno") ?? 0; //6th
    name = box.get("Name") ?? " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hiva")),
      body: Column(children: [
        Text(
          "A: $a",
          style: TextStyle(fontSize: 15),
        ),
        Text(
          "Name: $name",
          style: TextStyle(fontSize: 15),
        ),
        ElevatedButton(
            onPressed: () {
              name = "Alpa";
              a++;
              box.put("levalno", a);
              box.put("Name", name); //5th
              setState(() {});
            },
            child: Text("Submit")),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return view();
                },
              ));
            },
            child: Text("View"))
      ]),
    );
  }
}
