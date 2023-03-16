const user = require("../models/user");

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

const findByEmail = (req, res) => {
  user
    .findOne({
      email: req.params.email,
    })
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const insertUser = (req, res) => {
  const data = new user(req.body);
  data
    .save()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports = { findAll, insertUser, findByEmail };
