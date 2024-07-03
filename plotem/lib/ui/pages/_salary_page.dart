import 'package:flutter/material.dart';
import 'package:plotem/ui/widgets/const_component.dart';
import 'package:plotem/utils/const.dart';

class SalaryPage extends StatefulWidget {
  const SalaryPage({super.key});

  @override
  State<SalaryPage> createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Salary"),
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
                  isPaid: true,
                  salary: formatNumber(3000000),
                  date: "12/3/2003",
                ),
              ),
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
                  isPaid: false,
                  salary: formatNumber(3000000),
                  date: "12/3/2003",
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
  final isPaid;
  final salary;
  final date;
  ListSalaryHistory({
    super.key,
    required this.isPaid,
    required this.salary,
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
              isPaid
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
                  isPaid
                      ? Text(
                          "Paid",
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          "Unpaid",
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
                salary.toString(),
                style: TextStyle(
                  color: isPaid ? mysecondaryColor : Colors.red,
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

class ModalSalary extends StatelessWidget {
  const ModalSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Text(
                      "Detail Salary",
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
                        Text("Base Salary"),
                        Text(
                          "+" + "30000000".toString(),
                          style: TextStyle(
                            color: mysecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
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
                        Text("Allowance"),
                        Text(
                          "+" + "10000000".toString(),
                          style: TextStyle(
                            color: mysecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
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
                        Text("Salary Deduction"),
                        Text(
                          "-" + "10000000".toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
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
                        Text("Detail Salary Deduction"),
                        SizedBox(
                          width: 150,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Pinjaman Koperasi, Asuransi, Potongan Kehadiran"
                                  .toString(),
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
                  Divider(color: dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Salary"),
                        Text(
                          "40000000".toString(),
                          style: TextStyle(
                            color: mysecondaryColor,
                            fontWeight: FontWeight.bold,
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
