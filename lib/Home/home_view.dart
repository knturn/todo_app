import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/custom_dropdown.dart';

import '../AddArea/add_view.dart';
import '../Constants/AppThema/AppThema/app_theme.dart';

import '../Models/todo_model.dart';
import '../service/data_manager.dart';

class HomeViewTODO extends StatefulWidget {
  const HomeViewTODO({Key? key}) : super(key: key);

  @override
  State<HomeViewTODO> createState() => _HomeViewTODOState();
}

class _HomeViewTODOState extends State<HomeViewTODO> {
  List<TodoModel> todos = [];

  @override
  void initState() {
    loadData();

    super.initState();
  }

  void navigateAddPage() {
    Route route = MaterialPageRoute(builder: (context) => const AddView());
    Navigator.push(context, route).then(onGoBack);
  }

  FutureOr onGoBack(value) {
    loadData();
  }

  loadData() {
    DataManager.material.getTodos(true).then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Card(child: buildListView(todos)),
      floatingActionButton: buildAddingPageButton(),
    );
  }

  FloatingActionButton buildAddingPageButton() {
    return FloatingActionButton.extended(
      elevation: 2,
      icon: const Icon(Icons.add),
      label: Text(
        "Add new one",
        style: TextStyle(color: LightColorTheme().addButonTextColor),
      ),
      onPressed: () => {
        navigateAddPage(),
      },
      shape: const StadiumBorder(),
      backgroundColor: LightColorTheme().addbuttonColor,
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          loadData();
        },
        icon: const Icon(Icons.checklist),
      ),
      title: Text(
        "Todos",
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: LightColorTheme().textColorHomeAppBar),
      ),
      actions: [
        CustomDropdown(tittleText: "Seçim Yapınız", onChanged: (data) {})
      ],
    );
  }

  Widget buildListView(List<TodoModel> todos) {
    return todos.isEmpty
        ? const Center(child: Text("data is empty"))
        : ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: LightColorTheme().seperatorColor,
                ),
            itemBuilder: (context, index) => Slidable(
                  startActionPane: slidableAction(index),
                  child: Card(
                    child: ListTile(
                      title: todos[index].isDone
                          ? Text(todos[index].isDone.toString(),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough))
                          : Text(todos[index].title.toString()),
                      subtitle: Text(todos[index].description.toString()),
                      leading: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: Checkbox(
                        onChanged: (bool? value) {
                          DataManager.material
                              .uptadeIsDone(todos[index])
                              .then((value) => loadData());
                        },
                        value: todos[index].isDone,
                      ),
                    ),
                  ),
                ),
            itemCount: todos.length);
  }

  ActionPane slidableAction(int index) {
    String doneexpresion = todos[index].isDone ? "UNDONE" : "DONE";
    String remove = "REMOVE";
    return ActionPane(
      children: [
        SlidableAction(
            spacing: 2,
            onPressed: (value) {
              DataManager.material
                  .uptadeIsDone(todos[index])
                  .then((value) => loadData());
            },
            backgroundColor: LightColorTheme().slidableBackgroundblue!,
            foregroundColor: LightColorTheme().circleAvatarBackground,
            icon: Icons.check,
            label: doneexpresion),
        SlidableAction(
          spacing: 2,
          onPressed: (value) {
            int? _id = todos[index].id;
            if (_id != null) {
              DataManager.material.delete(_id).then((value) => loadData());
            }
          },
          backgroundColor: LightColorTheme().slidableBackgroundred!,
          foregroundColor: LightColorTheme().circleAvatarBackground,
          icon: Icons.delete,
          label: remove,
        )
      ],
      motion: const BehindMotion(),
    );
  }
}
