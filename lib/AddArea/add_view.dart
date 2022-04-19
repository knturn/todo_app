import 'package:flutter/material.dart';

import '../AppThema/app_theme.dart';
import '../Models/todo_model.dart';
import '../features/CustomTextFieldArea/custom_text_field.dart';
import '../service/data_manager.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAddingPageAppBar(),
        body: Card(
          elevation: 5,
          child: Column(
            children: [
              Container(
                child: (Column(
                  children: [
                    CustomTextField(
                      texteditingController: titleController,
                      descriptioneditingController: descriptionController,
                    ),
                  ],
                )),
              ),
              Divider(
                color: LightColorTheme().dividerColor,
                thickness: 3,
              ),
            ],
          ),
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
              DataManager.material.addTodo(TodoModel(
                isDone: false,
                title: titleController.text,
                description: descriptionController.text,
              ));
            },
            icon: const Icon(Icons.add),
            color: LightColorTheme().appbarIconsColor,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 30, left: 50),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check_sharp),
                color: LightColorTheme().appbarIconsColor,
              ),
            ))
      ],
    );
  }
}
