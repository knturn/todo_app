import 'package:flutter/material.dart';

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
      body: Column(
        children: const [
          TextField(
            maxLines: 1,
            maxLength: 30,
            decoration: InputDecoration(
              icon: Icon(Icons.title),
              hintText: ("BAŞLIK"),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: ("Açıklamalar"),
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAddingPageAppBar() {
    return AppBar(
      elevation: 10,
      shadowColor: Colors.greenAccent,
      actions: const <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.cancel,
            size: 35,
            color: Color.fromARGB(255, 228, 106, 6),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Padding(
          padding: EdgeInsets.only(right: 30),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.check,
              size: 35,
              color: Color.fromARGB(255, 228, 106, 6),
            ),
          ),
        )
      ],
    );
  }
}
