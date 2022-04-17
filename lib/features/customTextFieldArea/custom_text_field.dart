import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String title = "Başlık";
  String descrition = "Açıklama";
  CustomTextField({
    Key? key,
    required this.title,
    required this.descrition,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Column(
        children: [
          TextField(
            maxLines: 1,
            maxLength: 30,
            decoration: InputDecoration(
              icon: const Icon(Icons.title),
              hintText: (title),
            ),
          ),
          TextField(
            maxLines: 6,
            decoration: InputDecoration(hintText: (descrition)),
          )
        ],
      )),
    );
  }
}
