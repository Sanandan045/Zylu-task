// seed.js
const mongoose = require("mongoose");
const { connectMongoDb } = require("./connection");
const Employee = require("./model/employee_model");

connectMongoDb("mongodb://127.0.0.1:27017/zylu")
  .then(() => console.log("MongoDB connected"))
  .catch((err) => console.log(err));

const employees = [
  { name: "John Doe", startDate: new Date("2015-05-15"), isActive: true },
  { name: "Jane Smith", startDate: new Date("2019-03-01"), isActive: false },
  { name: "Alice Johnson", startDate: new Date("2014-08-22"), isActive: true },
  { name: "Bob Brown", startDate: new Date("2017-11-10"), isActive: true },
  { name: "Charlie Black", startDate: new Date("2020-01-01"), isActive: false },
  { name: "David White", startDate: new Date("2016-06-20"), isActive: true },
  { name: "Emma Green", startDate: new Date("2013-09-14"), isActive: true },
  { name: "Frank Blue", startDate: new Date("2018-04-18"), isActive: false },
  { name: "Grace Red", startDate: new Date("2012-11-25"), isActive: true },
  { name: "Henry Yellow", startDate: new Date("2011-07-30"), isActive: true },
  { name: "Ivy Purple", startDate: new Date("2019-05-15"), isActive: true },
  { name: "Jack Grey", startDate: new Date("2014-10-21"), isActive: false },
  { name: "Kate Brown", startDate: new Date("2017-08-05"), isActive: true },
];

Employee.insertMany(employees)
  .then(() => {
    console.log("Data seeded");
    mongoose.connection.close();
  })
  .catch((err) => {
    console.error(err);
  });
