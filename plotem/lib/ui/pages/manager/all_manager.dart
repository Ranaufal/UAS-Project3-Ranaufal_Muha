import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:plotem/ui/pages/manager/employee_manager.dart';
import 'package:plotem/ui/pages/manager/home_manager.dart';
import 'package:plotem/ui/pages/manager/profile_manager.dart';
import 'package:plotem/ui/pages/manager/quality_manager.dart';
import 'package:plotem/ui/widgets/glass_bg.dart';
import 'package:plotem/utils/const.dart';

class AllManager extends StatefulWidget {
  const AllManager({super.key});

  @override
  State<AllManager> createState() => _AllManagerState();
}

class _AllManagerState extends State<AllManager> {
  int _selectedIndex = 0;
  DateTime? _lastTapTime;
  bool changeColor = false;
  Timer? _colorResetTimer;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeManager(),
    EmployeeManager(),
    QualityManager(),
    ProfileManager(),
  ];

  void _onTabChange(int index) {
    DateTime now = DateTime.now();
    if (index == 3) {
      // Index for Profile Page
      if (_selectedIndex == 3 &&
          _lastTapTime != null &&
          now.difference(_lastTapTime!) < Duration(seconds: 1)) {
        // Handle double tap to navigate to dashboard
        Navigator.pushReplacementNamed(context, '/home');
      }
      _lastTapTime = now;
      changeColor = true;

      // Reset the timer if it's already running
      _colorResetTimer?.cancel();
      _colorResetTimer = Timer(Duration(seconds: 1), () {
        setState(() {
          changeColor = false;
        });
      });
    } else {
      _lastTapTime = null; // Reset _lastTapTime if switching to a different tab
      changeColor = false;
      _colorResetTimer?.cancel();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Border? changeBorderColor() {
    return changeColor ? Border.all(color: myprimarColor, width: 2) : null;
  }

  @override
  void dispose() {
    _colorResetTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: GlassBackground(
          theChild: Stack(
            children: [
              _widgetOptions.elementAt(_selectedIndex),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: glassBorderColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: MyGlassBox(
                      theChild: Container(
                        color: bgColor.withOpacity(.5),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 20, 25, 35),
                          child: GNav(
                            color: disabledColor,
                            activeColor: frontColor,
                            tabBackgroundColor: disabledBgColor,
                            tabActiveBorder: changeBorderColor(),
                            padding: const EdgeInsets.all(16),
                            gap: 8,
                            onTabChange: _onTabChange,
                            tabs: const [
                              GButton(
                                icon: Icons.home,
                                text: "Home",
                              ),
                              GButton(
                                icon: Icons.list,
                                text: "Employee",
                              ),
                              GButton(
                                icon: Icons.bar_chart_sharp,
                                text: "Quality",
                              ),
                              GButton(
                                icon: Icons.person,
                                text: "Profile",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
