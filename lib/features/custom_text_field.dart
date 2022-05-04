import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController texteditingController;
  TextEditingController descriptioneditingController;
  CustomTextField({
    Key? key,
    required this.texteditingController,
    required this.descriptioneditingController,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String title = "Title";
  String descrition = "Description";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Column(
        children: [
          TextField(
            controller: widget.texteditingController,
            maxLines: 1,
            maxLength: 20,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.title,
                color: Colors.orangeAccent,
              ),
              hintText: (title),
            ),
          ),
          TextField(
            controller: widget.descriptioneditingController,
            maxLines: 6,
            decoration: InputDecoration(hintText: (descrition)),
          ),
        ],
      )),
    );
  }
}
