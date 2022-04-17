import 'package:flutter/material.dart';
import 'package:todo_app/service/data_manager.dart';

import '../features/customTextFieldArea/Custom_Text_Field.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAddingPageAppBar(),
      body: Card(
        elevation: 5,
        child: Column(
          children: [
            CustomTextField(
              title: "Başlık",
              descrition: "Açıklama",
            ),
            const Divider(
              color: Color.fromARGB(255, 235, 70, 5),
              thickness: 3,
            ),
            //CustomTextField(title: "title", descrition: "descrition"),
          ],
        ),
      ),
    );
  }

  AppBar buildAddingPageAppBar() {
    return AppBar(
      elevation: 10,
      shadowColor: Colors.greenAccent,
      actions: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              DataManager().addTodo();
            },
            icon: const Icon(Icons.add),
            color: const Color.fromARGB(255, 228, 106, 6),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 30, left: 50),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  DataManager().readingSql();
                },
                icon: const Icon(Icons.check_sharp),
                color: const Color.fromARGB(255, 228, 106, 6),
              ),
            ))
      ],
    );
  }
}
