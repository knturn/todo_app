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
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool selectionIsActive = false;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    if (titleController.text.isEmpty) {
      titleController.addListener(() {
        bool selectionIsActive = titleController.text.isNotEmpty &
            descriptionController.text.isNotEmpty;
        setState(() {
          this.selectionIsActive = selectionIsActive;
        });
      });
      descriptionController.addListener(() {
        bool selectionIsActive = descriptionController.text.isNotEmpty &
            titleController.text.isNotEmpty;
        setState(() {
          this.selectionIsActive = selectionIsActive;
        });
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAddingPageAppBar(context),
        body: Column(
          children: [
            (CustomTextField(
              texteditingController: titleController,
              descriptioneditingController: descriptionController,
            )),
            Divider(
              color: LightColorTheme().dividerColor,
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAddingPageAppBar(context) {
    return AppBar(
      elevation: 10,
      shadowColor: Colors.greenAccent,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: selectionIsActive
                  ? () {
                      DataManager.material
                          .addTodo(TodoModel(
                            isDone: false,
                            title: titleController.text,
                            description: descriptionController.text,
                          ))
                          .then((value) => Navigator.pop(context));
                      selectionIsActive = false;
                    }
                  : null,
              icon: const Icon(Icons.add),
              disabledColor: const Color.fromARGB(255, 5, 0, 0),
              color: LightColorTheme().appbarIconsColor,
            ),
          ),
        ),
      ],
    );
  }
}
/*
void _showAlertDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Hey there is nothing!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('You have to fill two area too'),
              Text('İs everyting ok?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
*/