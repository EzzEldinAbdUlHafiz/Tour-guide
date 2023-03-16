const museum = require("../models/museum");

const findAll = (req, res) => {
  museum
    .find()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const findByName = (req, res) => {
  museum
    .findOne({
      name: req.params.name,
    })
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const findByCity = (req, res) => {
  museum
    .find({
      city: req.params.city,
    })
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const insertMuseum = (req, res) => {
  const data = new museum(req.body);
  data
    .save()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports = { findAll, insertMuseum, findByName, findByCity };
