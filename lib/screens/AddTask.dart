import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo/taskmodel/taskmodel.dart';

// ignore: must_be_immutable
class Addtask extends StatelessWidget {
  final ValueSetter<Taskmodel> _valueSetter;
  Addtask(this._valueSetter);
  List<Taskmodel> addtask = [];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController taskcontroller = TextEditingController();
    TextEditingController titlecontroller = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 20, 0),
            child: Text(
              'Title ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
              controller: titlecontroller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              maxLength: 100,
              maxLines: 2,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Write Here',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 20, 0),
            child: Text(
              'Things To Do:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
              controller: taskcontroller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              maxLength: 1000,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Write Here',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 20, 10),
            child: SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Colors.purple[600],
                    onPressed: () {
                      addtask.add(Taskmodel(titlecontroller.text.toString(),
                          taskcontroller.text.toString()));
                      _valueSetter(addtask[index]);
                      titlecontroller.text = '';
                      taskcontroller.text = '';
                      alert(context, titlecontroller.text);
                    })),
          ),
        ],
      ),
    ));
  }

  void alert(context, String title) {
    Alert(
        context: context,
        title: '$title',
        desc: "Your task has been added",
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
