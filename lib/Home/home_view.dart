import 'package:flutter/material.dart';

class HomeViewTODO extends StatefulWidget {
  const HomeViewTODO({Key? key}) : super(key: key);

  @override
  State<HomeViewTODO> createState() => _HomeViewTODOState();
}

class _HomeViewTODOState extends State<HomeViewTODO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "TODOS",
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              backgroundColor: Color.fromARGB(255, 4, 6, 121)),
        )),
      ),
      body: Card(
        child: ListView.builder(
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
        ),
      ),
    );
  }
}

List<int> sayilar = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
