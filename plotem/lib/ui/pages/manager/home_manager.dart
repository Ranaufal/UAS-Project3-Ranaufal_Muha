// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plotem/ui/pages/manager/_absence_manager.dart';
import 'package:plotem/ui/pages/manager/_workleave_manager.dart';
import 'package:plotem/ui/pages/manager/quality_manager.dart';
import 'package:plotem/ui/widgets/mymenu.dart';
import 'package:plotem/utils/const.dart';
import 'package:intl/intl.dart';

class HomeManager extends StatefulWidget {
  const HomeManager({super.key});

  @override
  State<HomeManager> createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(
                      color: disabledColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Hi,",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        myUsername,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage(
                  "./lib/assets/ifal.JPG",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        // Services
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyMenu(
                    title: "Absensi",
                    theicon: Icons.group,
                    theWidget: const AbsenceManager(),
                  ),
                  // SizedBox(width: 15),
                  // MyMenu(
                  //   title: "Salary",
                  //   theicon: Icons.money,
                  //   theWidget: const HomeManager(),
                  // ),
                  SizedBox(width: 15),
                  MyMenu(
                    title: "Work Leave",
                    theicon: Icons.holiday_village_rounded,
                    theWidget: const WorkLeaveManager(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     MyMenu(
              //       title: "Pegawai",
              //       theicon: Icons.list,
              //       theWidget: const HomeManager(),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Services
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "News",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShBR_SzP0C5ObeNp1Y0cuHGSxjh-z2STdHgnq5NS_AftHLf1MMDelo1sByGwC7lPZRVWc&usqp=CAU",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: glassColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Libur Telah Tiba",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "buruan selesaikan kerjaan mu untuk mendapatkan bonus dari perusahaan. ",
                              style: TextStyle(
                                color: disabledColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class ManagerMenu extends StatelessWidget {
//   String title;
//   IconData theicon;
//   final theWidget;
//   ManagerMenu({
//     super.key,
//     required this.title,
//     required this.theicon,
//     required this.theWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (builder) => theWidget));
//           },
//           child: Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: glassColor,
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(
//                 color: glassBorderColor,
//               ),
//             ),
//             child: Icon(
//               theicon,
//               color: disabledColor,
//               size: 30,
//             ),
//           ),
//         ),
//         const SizedBox(height: 7),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 12,
//             color: disabledColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
