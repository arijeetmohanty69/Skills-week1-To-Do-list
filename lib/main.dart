// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'To Do List\nHome Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              height: 128,
              padding: EdgeInsets.all(24),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage("assets/img.jpg"),
                  ),
                  Text("LVL:--", style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 200,
                    height: 10,
                    child: LinearProgressIndicator(
                      minHeight: 2,
                      backgroundColor: Color.fromARGB(106, 96, 125, 139),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue,
                      ),
                      value: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color.fromARGB(94, 96, 125, 139),
            padding: EdgeInsets.only(left: 24, bottom: 24, right: 24,top: 12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "USER: ARIJEET MOHANTY",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "TASK COUNT:5 ",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    Text(
                      "COMPLETED:0 ",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text("Tasks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          Expanded(
            
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: _counter,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Color.fromARGB(49, 100, 131, 146),
                  child: Center(
                      child: Text(
                    "Entry",
                    style: TextStyle(color: Colors.white),
                  )),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
