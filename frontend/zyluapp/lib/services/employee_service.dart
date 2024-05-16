import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee.dart';

class EmployeeService {
  final String apiUrl = 'http://192.168.43.229:8000/employees';

  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse
          .map((employee) => Employee.fromJson(employee))
          .toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
