// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:plotem/ui/widgets/myquality.dart';
import 'package:plotem/utils/const.dart';

class QualityPage extends StatefulWidget {
  const QualityPage({super.key});

  @override
  State<QualityPage> createState() => _QualityPageState();
}

class _QualityPageState extends State<QualityPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            "Quality Screen",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (int i = 0; i < 2; i++)
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: MyQualityWidget(
                  nama: "ifalgaul",
                  performa: 60,
                  url_profile: "",
                  created_at: "2024-6-7",
                ),
              ),
              Divider(color: dividerColor),
            ],
          ),
        const SizedBox(height: 100),
      ],
    );
  }
}
