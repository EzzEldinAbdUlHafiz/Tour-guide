require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const router = require("./router");
const cors = require("cors");
const app = express();
const PORT = 3000;

app.use(express.json());
app.use(router);
app.use(cors());

mongoose
  .connect(process.env.URI)
  .then(() => {
    console.log("Connected to MongoDB");
    app.listen(PORT, () => {
      console.log(`Server running on http://localhost:${PORT}`);
      console.log(`Server running on :${PORT}`);
    });
  })
  .catch((err) => {
    console.log(err);
  });
