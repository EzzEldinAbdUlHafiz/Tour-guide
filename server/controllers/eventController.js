const event = require("../models/event");

const findAll = (req, res) => {
  event
    .find()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const insertEvent = (req, res) => {
  const data = new event(req.body);
  data
    .save()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const findByName = (req, res) => {
  event
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

module.exports = { findAll, insertEvent, findByName };
