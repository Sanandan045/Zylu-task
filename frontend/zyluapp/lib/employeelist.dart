import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../services/employee_service.dart';

class EmployeeList extends StatelessWidget {
  final EmployeeService employeeService = EmployeeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        ' Zylu Employees List',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Note : employee who is been more than 5 years and is active with the organization needs to be flagged in green color.",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.amber),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<Employee>>(
                future: employeeService.fetchEmployees(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final employees = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        final isFlagged = employee.isActive &&
                            DateTime.now()
                                    .difference(employee.startDate)
                                    .inDays >
                                5 * 365;
                        final yearsDifference =
                            DateTime.now().year - employee.startDate.year;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            title: Text(
                              employee.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                            subtitle: Text(
                                'Started on: ${employee.startDate.toLocal().toString().split(' ')[0]} (${yearsDifference} years ago)'),
                            tileColor: isFlagged
                                ? Colors.green.withOpacity(0.3)
                                : Colors.transparent,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
