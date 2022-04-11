import 'package:flutter/material.dart';

import '../AddArea/add_view.dart';

class HomeViewTODO extends StatefulWidget {
  const HomeViewTODO({Key? key}) : super(key: key);

  @override
  State<HomeViewTODO> createState() => _HomeViewTODOState();
}

class _HomeViewTODOState extends State<HomeViewTODO> {
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
      leading: const Icon(
        Icons.checklist,
        size: 35,
      ),
      title: const Text(
        "Todos",
        style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 221, 221, 238)),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: const Text("Kaan"),
        leading: Text(
          sayilar[index].toString(),
          style: const TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      itemCount: sayilar.length,
    );
  }
}

FloatingActionButton buildButton(context) {
  return FloatingActionButton.extended(
    elevation: 2,
    icon: const Icon(Icons.add),
    label: const Text("Add new one"),
    onPressed: () => {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AddView(),
      )),
    },
    shape: const StadiumBorder(),
    backgroundColor: const Color.fromARGB(255, 10, 14, 236),
  );
}

List<int> sayilar = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
