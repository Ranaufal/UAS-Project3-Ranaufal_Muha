import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plotem/models/cuti.dart';
import 'package:plotem/services/repo_cuti.dart';
import 'package:plotem/ui/pages/confirmation_page.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class WorkLeavePage extends StatefulWidget {
  const WorkLeavePage({super.key});

  @override
  State<WorkLeavePage> createState() => _WorkLeavePageState();
}

class _WorkLeavePageState extends State<WorkLeavePage> {
  List<Cuti> listCuti = [];
  CutiRepository cutiRepository = CutiRepository();

  getData() async {
    listCuti = await cutiRepository.getMyCuti();
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
        title: const Text("Work Leave"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AddWorkLeave(
                      onWorkLeaveAdd: () {},
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                "History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < listCuti.length; i++)
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ModalSalary();
                      },
                    );
                  },
                  child: ListSalaryHistory(
                    isAccepted: listCuti[i].status_cuti,
                    totalDays: listCuti[i].days,
                    date: listCuti[i].created_at,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListSalaryHistory extends StatelessWidget {
  int? isAccepted;
  final totalDays;
  final date;
  ListSalaryHistory({
    super.key,
    required this.isAccepted,
    required this.totalDays,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              isAccepted == null
                  ? Icon(
                      Icons.sick,
                      color: Colors.orange,
                    )
                  : isAccepted == true
                      ? Icon(
                          Icons.check,
                          color: mysecondaryColor,
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isAccepted == null
                      ? Text(
                          "Waiting...",
                          style: TextStyle(color: Colors.white),
                        )
                      : isAccepted == true
                          ? Text(
                              "Accepted",
                              style: TextStyle(color: Colors.white),
                            )
                          : Text(
                              "Rejected",
                              style: TextStyle(color: Colors.white),
                            ),
                  Text(
                    date,
                    style: TextStyle(
                      color: disabledColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                totalDays.toString() + " Days",
                style: TextStyle(
                  color: isAccepted == null
                      ? Colors.orange
                      : isAccepted == true
                          ? mysecondaryColor
                          : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_drop_up_sharp,
                color: disabledColor,
              )
            ],
          ),
        ),
        Divider(color: dividerColor),
      ],
    );
  }
}

// =============================================================================
class ModalSalary extends StatelessWidget {
  const ModalSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: 60,
                  child: Divider(
                    thickness: 3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Spacer(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Text(
                      "Detail Work Leave",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Submission date"),
                        Text(
                          "2024-5-22".toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Detail"),
                        Text(
                          "sick",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leave duration"),
                        Text(
                          3.toString() + " Days",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leave status"),
                        SizedBox(
                          width: 150,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Rejected".toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // ===============================
          ],
        ),
      ),
    );
  }
}

// =============================================================================
class AddWorkLeave extends StatefulWidget {
  final Function onWorkLeaveAdd;
  AddWorkLeave({
    super.key,
    required this.onWorkLeaveAdd,
  });

  @override
  State<AddWorkLeave> createState() => _AddWorkLeaveState();
}

class _AddWorkLeaveState extends State<AddWorkLeave> {
  bool isFinished = false;

  final detailWorkLeave = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  CutiRepository cuti = CutiRepository();

  DateTime? selectStartDate;
  DateTime? selectEndDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectStartDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green, // Header background color
            // accentColor: Colors.green, // Header text color
            colorScheme:
                ColorScheme.light(primary: Colors.green), // Selection color
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // OK/Cancel button text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectStartDate) {
      setState(() {
        selectStartDate = pickedDate;
        startDateController.text = formatDate(selectStartDate!);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectEndDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green, // Header background color
            // accentColor: Colors.green, // Header text color
            colorScheme:
                ColorScheme.light(primary: Colors.green), // Selection color
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // OK/Cancel button text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectEndDate) {
      setState(() {
        selectEndDate = pickedDate;
        endDateController.text = formatDate(selectEndDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: frontColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: 60,
                child: Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Work Leave",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      LoginTextField(
                        controller: detailWorkLeave,
                        icon: Icons.holiday_village,
                        obscureText: false,
                        title: "detail...",
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => _selectStartDate(context),
                        child: DateTextField(
                          controller: startDateController,
                          icon: Icons.date_range,
                          title: "start date",
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => _selectEndDate(context),
                        child: DateTextField(
                          controller: endDateController,
                          icon: Icons.date_range,
                          title: "end date",
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: SwipeableButtonView(
                          buttonText: 'slide to add work leave',
                          buttontextstyle: TextStyle(),
                          buttonWidget: Icon(
                            Icons.chevron_right_rounded,
                            size: 30,
                            color: myprimarColor,
                          ),
                          activeColor: myprimarColor,
                          onWaitingProcess: () {
                            Future.delayed(
                              Duration(milliseconds: 500),
                              () => setState(() => isFinished = true),
                            );
                          },
                          isFinished: isFinished,
                          onFinish: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                child: ConfirmationPage(),
                                type: PageTransitionType.fade,
                              ),
                            );
                            cuti.addWorkLeave(
                                detailWorkLeave.text,
                                startDateController.text,
                                endDateController.text);
                            widget.onWorkLeaveAdd();
                            // ---- the action ----
                            setState(() => isFinished = false);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
