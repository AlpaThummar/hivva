import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'main.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  int a = 0;
  String name="";
  Box box = Hive.box("testBox");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = box.get("levalno") ?? 0; //get from the data by pervious page
    name= box.get("Name")??" ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hiva")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Text(
                "A: $a",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "Name: $name",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Hiva_demo();
                    },
                  ));
                },
                child: Text("Add"))
          ]),
    );
  }
}
