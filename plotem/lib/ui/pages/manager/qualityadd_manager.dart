import 'package:flutter/material.dart';
import 'package:plotem/models/user_search.dart';
import 'package:plotem/services/repo_user.dart';
import 'package:plotem/services/repo_workassessment.dart';
import 'package:plotem/utils/const.dart';

class QualityAddManager extends StatefulWidget {
  const QualityAddManager({super.key});

  @override
  State<QualityAddManager> createState() => _QualityAddManagerState();
}

class _QualityAddManagerState extends State<QualityAddManager> {
  TextStyle myfontstyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  int? _selectedEmployeesOption;
  int? _selectedAttendance;
  int? _selectedPerformance;
  int? _selectedTeamwork;
  int? _selectedCreativity;
  int? _selectedLeadership;
  int? _selectedProblemSolving;

  List<UserSearch> _optionsEmployees = [];
  UserRepository userRepository = UserRepository();
  WorkAssessmentRepository workAssessmentRepository =
      WorkAssessmentRepository();

  getData() async {
    _optionsEmployees = await userRepository.getUserByManager();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Add Performance"),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Employees", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedEmployeesOption,
                    hint: Text(
                      'Select an option',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: _optionsEmployees.map((UserSearch userSearch) {
                      return DropdownMenuItem<int>(
                        value: userSearch.pegawai_id,
                        child: Text(userSearch.nama.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedEmployeesOption = newValue!;
                        print(_selectedEmployeesOption);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              Divider(color: dividerColor),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Attendance", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedAttendance,
                    hint: Text(
                      'Rate employee ',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedAttendance = newValue!;
                        print(_selectedAttendance);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Performance", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedPerformance,
                    hint: Text(
                      'Rate employee ',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedPerformance = newValue!;
                        print(_selectedPerformance);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Team Work", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedTeamwork,
                    hint: Text(
                      'Rate employee ',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedTeamwork = newValue!;
                        print(_selectedTeamwork);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Creativity", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedCreativity,
                    hint: Text(
                      'Rate employee ',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedCreativity = newValue!;
                        print(_selectedCreativity);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Leadership", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedLeadership,
                    hint: Text(
                      'Rate employee ',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedLeadership = newValue!;
                        print(_selectedLeadership);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Problem Solving", style: myfontstyle),
                  DropdownButton<int>(
                    value: _selectedProblemSolving,
                    hint: Text(
                      'Rate employee ',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: List.generate(10, (index) => index + 1)
                        .map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedProblemSolving = newValue!;
                        print(_selectedProblemSolving);
                      });
                    },
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                    underline: SizedBox(), // Remove underline
                    iconEnabledColor: Colors.white, // Icon color when enabled
                    iconDisabledColor: Colors.grey, // Icon color when disabled
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_selectedEmployeesOption != null &&
                      _selectedAttendance != null &&
                      _selectedPerformance != null &&
                      _selectedTeamwork != null &&
                      _selectedCreativity != null &&
                      _selectedLeadership != null &&
                      _selectedProblemSolving != null) {
                    var total = ((_selectedAttendance! +
                                _selectedPerformance! +
                                _selectedTeamwork! +
                                _selectedCreativity! +
                                _selectedLeadership! +
                                _selectedProblemSolving!) /
                            6) *
                        10;
                    workAssessmentRepository.createWorkAssessment(
                      myUserId,
                      _selectedEmployeesOption,
                      _selectedAttendance,
                      _selectedPerformance,
                      _selectedTeamwork,
                      _selectedCreativity,
                      _selectedLeadership,
                      _selectedProblemSolving,
                      total,
                    );
                  } else {
                    // Handle null values
                    print("Please fill all the fields");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mysecondaryColor, // background color
                  foregroundColor: Colors.black, // text color
                  elevation: 5, // button's elevation when it's pressed
                ),
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
