const user = require("../models/user");
const bcrypt = require("bcrypt");

const findAll = (req, res) => {
  user
    .find()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const login = (req, res) => {
  const data = new user(req.body);
  user
    .findOne({
      email: data.email,
    })
    .then(async (result) => {
      if (await bcrypt.compare(data.password, result.password)) {
        res.send(result);
      } else {
        res.send("no user found");
      }
    })
    .catch((err) => {
      console.log(err);
    });
};

const register = async (req, res) => {
  const data = new user(req.body);
  data.password = await bcrypt.hash(data.password, 10);
  data
    .save()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports = { findAll, register, login };
