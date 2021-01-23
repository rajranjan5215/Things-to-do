import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Tasks extends StatefulWidget {
  final task;
  Tasks(this.task);
  @override
  State<StatefulWidget> createState() {
    return _Taskstate(this.task);
  }
}

class _Taskstate extends State<Tasks> {
  final task;
  _Taskstate(this.task);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
            color: Colors.white,
            child: ExpansionTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.note,
                ),
              ),
              title: Text(
                '${task[index].title}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Colors.purple[200],
              expandedAlignment: Alignment.bottomLeft,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 0, 20),
                      child: Text(
                        '${task[index].description}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              ],
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      task.removeAt(index);
                      alert(context);
                    });
                  }),
            ),
          );
        },
      ),
    );
  }

  void alert(context) {
    Alert(
        context: context,
        title: 'Things To Do',
        desc: "Your task has been deleted",
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 50,
          )
        ]).show();
  }
}
