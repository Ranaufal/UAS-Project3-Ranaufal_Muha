import 'package:flutter/material.dart';
import 'package:plotem/utils/const.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage(
                "./lib/assets/ifal.JPG",
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myUsername,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Manager",
              style: TextStyle(
                color: disabledColor,
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("4.2"),
                SizedBox(width: 5),
                Icon(Icons.star, size: 16, color: disabledColor),
                Icon(Icons.star, size: 16, color: disabledColor),
                Icon(Icons.star, size: 16, color: disabledColor),
                Icon(Icons.star, size: 16, color: disabledColor),
                Icon(Icons.star,
                    size: 16, color: disabledColor.withOpacity(.3)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
