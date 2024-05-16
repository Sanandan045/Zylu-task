const express = require("express");
const app = express();

const bodyParser = require("body-parser");
const cors = require("cors");

const { connectMongoDb } = require("./connection");
const Employee = require("./model/employee_model");

const port = 8000;

app.use(bodyParser.json());
app.use(cors());

connectMongoDb("mongodb://127.0.0.1:27017/zylu")
  .then(() => console.log("MongoDB connected"))
  .catch((err) => console.log(err));

app.get("/", (req, res) => {
  res.send("Hello World!");
});

// API to get all employees
app.get("/employees", async (req, res) => {
  try {
    const employees = await Employee.find();
    res.json(employees);
  } catch (err) {
    res.status(500).send(err);
  }
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
