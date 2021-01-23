import 'package:flutter/material.dart';
import 'package:todo/screens/AddTask.dart';
import 'package:todo/screens/Tasks.dart';
import 'package:todo/taskmodel/taskmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Raleway',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Todostate();
  }
}

class _Todostate extends State<TodoApp> {
  List<Taskmodel> task = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            centerTitle: true,
            title: Text('Things To Do'),
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Tasks'),
                Tab(
                  text: 'Add Task',
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            Tasks(task),
            Addtask((taskitem) {
              setState(() {
                task.add(taskitem);
              });
            }),
          ]),
        ));
  }
}
