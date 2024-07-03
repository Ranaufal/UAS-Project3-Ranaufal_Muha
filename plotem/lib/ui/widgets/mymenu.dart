// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plotem/utils/const.dart';

class MyMenu extends StatelessWidget {
  String title;
  IconData theicon;
  final theWidget;
  MyMenu({
    super.key,
    required this.title,
    required this.theicon,
    required this.theWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => theWidget));
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: glassColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: glassBorderColor,
              ),
            ),
            child: Icon(
              theicon,
              color: disabledColor,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: disabledColor,
          ),
        ),
      ],
    );
  }
}
