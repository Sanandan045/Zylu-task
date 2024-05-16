// models/employee.js
const mongoose = require("mongoose");

const employeeSchema = new mongoose.Schema({
  name: String,
  startDate: Date,
  isActive: Boolean,
});

const Employee = mongoose.model("Employee", employeeSchema);
module.exports = Employee;
