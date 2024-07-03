import 'package:flutter/material.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class MyQualityWidget extends StatelessWidget {
  String nama;
  String created_at;
  num performa;
  String? url_profile;
  MyQualityWidget({
    super.key,
    required this.nama,
    required this.created_at,
    required this.performa,
    required this.url_profile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 15,
          child: MyProfileImage(
            url: url_profile ?? "",
            radius: 20,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 3),
              Text(
                created_at,
                style: TextStyle(
                  fontSize: 12,
                  color: disabledColor,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    performa.round().toString(),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star,
                      size: 17,
                      color: performa > 10
                          ? disabledColor
                          : disabledColor.withOpacity(.3)),
                  Icon(Icons.star,
                      size: 17,
                      color: performa > 40
                          ? disabledColor
                          : disabledColor.withOpacity(.3)),
                  Icon(Icons.star,
                      size: 17,
                      color: performa > 60
                          ? disabledColor
                          : disabledColor.withOpacity(.3)),
                  Icon(Icons.star,
                      size: 17,
                      color: performa > 80
                          ? disabledColor
                          : disabledColor.withOpacity(.3)),
                  Icon(Icons.star,
                      size: 17,
                      color: performa > 95
                          ? disabledColor
                          : disabledColor.withOpacity(.3)),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}
