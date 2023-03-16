const artifact = require("../models/artifact");

const findAll = (req, res) => {
  artifact
    .find()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

const findByName = (req, res) => {
  artifact
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

const insertArtifact = (req, res) => {
  const data = new artifact(req.body);
  data
    .save()
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports = { findAll, insertArtifact, findByName };
