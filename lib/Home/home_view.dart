import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sqflite/sqflite.dart';

import '../AddArea/add_view.dart';
import '../AppThema/app_theme.dart';
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
    setState(() {});
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
      body: Card(child: buildListView()),
      floatingActionButton: buildAddingPageButton(),
    );
  }

  FloatingActionButton buildAddingPageButton() {
    return FloatingActionButton.extended(
      elevation: 2,
      icon: const Icon(Icons.add),
      label: const Text(
        "Add new one",
        style: TextStyle(color: Color.fromARGB(249, 0, 0, 0)),
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
      title: const Text(
        "Todos",
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 221, 221, 238)),
      ),
    );
  }

  Widget buildListView() {
    return todos.isEmpty
        ? const Center(child: Text("data is empty"))
        : ListView.separated(
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.amber,
                ),
            itemBuilder: (context, index) => Slidable(
                  startActionPane: slidableAction(index),
                  child: Card(
                    child: ListTile(
                      title: Text(todos[index].title.toString()),
                      subtitle: Text(todos[index].description.toString()),
                      leading: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
            itemCount: todos.length);
  }

  ActionPane slidableAction(int index) {
    return ActionPane(
      children: [
        const SlidableAction(
          spacing: 2,
          onPressed: null,
          backgroundColor: Color.fromARGB(255, 0, 160, 235),
          foregroundColor: Color.fromARGB(255, 243, 247, 243),
          icon: Icons.check,
          label: "DONE",
        ),
        SlidableAction(
          spacing: 2,
          onPressed: (value) {
            int? _id = todos[index].id;
            if (_id != null) {
              //setState(() {
              DataManager.material.delete(_id).then((value) => loadData());
              //});
            }
          },
          backgroundColor: const Color.fromARGB(255, 228, 29, 3),
          foregroundColor: const Color.fromARGB(255, 243, 247, 243),
          icon: Icons.delete,
          label: "LATE",
        )
      ],
      motion: const ScrollMotion(),
    );
  }
}
