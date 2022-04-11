import 'package:flutter/material.dart';

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
            CustomTextField(title: "title", descrition: "descrition"),
          ],
        ),
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
