import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:plotem/ui/pages/home_page.dart';
import 'package:plotem/ui/pages/profile_page.dart';
import 'package:plotem/ui/pages/quality_page.dart';
import 'package:plotem/ui/pages/search_page.dart';
import 'package:plotem/ui/widgets/glass_bg.dart';
import 'package:plotem/utils/const.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  int _selectedIndex = 0;
  DateTime? _lastTapTime;
  bool changeColor = false;
  Timer? _colorResetTimer;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    QualityPage(),
    ProfilePage(),
  ];

  void _onTabChange(int index) {
    DateTime now = DateTime.now();
    if (hakAkses != 3) {
      if (index == 3) {
        // Index for Profile Page
        if (_selectedIndex == 3 &&
            _lastTapTime != null &&
            now.difference(_lastTapTime!) < Duration(seconds: 1)) {
          // Handle double tap to navigate to dashboard
          Navigator.pushReplacementNamed(context, '/homemanager');
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
        _lastTapTime =
            null; // Reset _lastTapTime if switching to a different tab
        changeColor = false;
        _colorResetTimer?.cancel();
      }
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
                                icon: Icons.search,
                                text: "Search",
                              ),
                              GButton(
                                icon: Icons.high_quality_rounded,
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
