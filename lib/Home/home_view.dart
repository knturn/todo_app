import 'package:flutter/material.dart';
import '../AppThema/app_theme.dart';
import '../Models/todo_model.dart';
import '../service/data_manager.dart';

import '../AddArea/add_view.dart';

class HomeViewTODO extends StatefulWidget {
  const HomeViewTODO({Key? key}) : super(key: key);

  @override
  State<HomeViewTODO> createState() => _HomeViewTODOState();
}

class _HomeViewTODOState extends State<HomeViewTODO> {
  List<TodoModel> todos = [];
  List<TodoModel> doneTodos = [];
  @override
  void initState() {
    loadData();
    super.initState();
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
      body: Card(
        elevation: 3,
        child: buildListView(),
      ),
      floatingActionButton: buildButton(context),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          setState(() {
            loadData();
          });
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
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
                  title: Text(todos[index].title.toString()),
                  subtitle: Text(todos[index].description.toString()),
                  leading: Text(
                    [index].toString(),
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            itemCount: todos.length);
  }
}

FloatingActionButton buildButton(context) {
  return FloatingActionButton.extended(
    elevation: 2,
    icon: const Icon(Icons.add),
    label: const Text(
      "Add new one",
      style: TextStyle(color: Color.fromARGB(249, 0, 0, 0)),
    ),
    onPressed: () => {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AddView(),
      )),
    },
    shape: const StadiumBorder(),
    backgroundColor: LightColorTheme().addbuttonColor,
  );
}
