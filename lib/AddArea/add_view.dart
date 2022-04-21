import 'package:flutter/material.dart';
import '../Home/home_view.dart';

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
        appBar: buildAddingPageAppBar(context),
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
              onPressed: () {
                if (descriptionController.text.isEmpty |
                    titleController.text.isEmpty) {
                  return _showAlertDialog(context);
                } else {
                  DataManager.material
                      .addTodo(TodoModel(
                        isDone: false,
                        title: titleController.text,
                        description: descriptionController.text,
                      ))
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeViewTODO())));
                }
              },
              icon: const Icon(Icons.add),
              color: LightColorTheme().appbarIconsColor,
            ),
          ),
        ),
      ],
    );
  }
}

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
