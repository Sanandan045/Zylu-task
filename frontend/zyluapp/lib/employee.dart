import 'package:flutter/material.dart';

class EmployeeZyluScreen extends StatefulWidget {
  const EmployeeZyluScreen({super.key});

  @override
  State<EmployeeZyluScreen> createState() => _EmployeeZyluScreenState();
}

class _EmployeeZyluScreenState extends State<EmployeeZyluScreen> {
  List<Employee> employees = [
    Employee(name: 'John Doe', yearsOfService: 3, isActive: true),
    Employee(name: 'Jane Doe', yearsOfService: 7, isActive: true),
    Employee(name: 'Bob Smith', yearsOfService: 2, isActive: false),
    Employee(name: 'Alice Johnson', yearsOfService: 10, isActive: true),
    Employee(name: 'Charlie Brown', yearsOfService: 4, isActive: false),
    Employee(name: 'David Lee', yearsOfService: 9, isActive: true),
    // Add more employees to the list
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zylu Employee list"),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(employees[index].name),
            trailing:
                employees[index].yearsOfService > 5 && employees[index].isActive
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Icon(Icons.circle),
          );
        },
      ),
    );
  }
}

class Employee {
  String name;
  int yearsOfService;
  bool isActive;

  Employee(
      {required this.name,
      required this.yearsOfService,
      required this.isActive});
}
