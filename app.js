const express = require("express");
const mongoose = require("mongoose");

const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  return res.send("ABHISHEK YADAV COMPLETED CI/CD PIPELINE SUCCESSFULLY");
});

app.listen(5000, () => {
  console.log(`Server Started at ${5000}`);
});
