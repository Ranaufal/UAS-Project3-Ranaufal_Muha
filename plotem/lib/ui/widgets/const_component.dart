// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plotem/utils/const.dart';

class MyProfileImage extends StatelessWidget {
  String url;
  double radius;
  MyProfileImage({
    super.key,
    required this.url,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider =
        const AssetImage("./lib/assets/logo-sm-bggradient.png");
    return CircleAvatar(
      maxRadius: radius == 0 ? 25 : radius,
      backgroundImage: url.isEmpty ? imageProvider : NetworkImage(url),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final controller;
  final title;
  bool obscureText;
  final icon;
  LoginTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: frontColor),
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: disabledColor,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: glassBorderColor),
          ),
          fillColor: glassColor,
          filled: true,
          hintText: title,
          hintStyle: TextStyle(color: disabledColor),
          contentPadding: EdgeInsets.symmetric(vertical: 15)),
    );
  }
}

class DateTextField extends StatelessWidget {
  final controller;
  final title;
  final icon;
  DateTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: TextField(
        controller: controller,
        style: TextStyle(color: frontColor),
        readOnly: true,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            prefixIconColor: disabledColor,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: glassBorderColor),
            ),
            fillColor: glassColor,
            filled: true,
            hintText: title,
            hintStyle: TextStyle(color: disabledColor),
            contentPadding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }
}

String formatNumber(int number) {
  final formatter = NumberFormat('#,##0', 'en_US');
  return formatter.format(number).replaceAll(',', '.');
}

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}
