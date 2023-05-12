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

const findByRFID = (req, res) => {
  artifact
    .findOne({
      rfid: req.params.rfid,
    })
    .then((result) => {
      if (result != null) {
        res.send(result);
      } else {
        res.status(404).send("Artifact not found");
      }
    })
    .catch((err) => {
      console.log(err);
      res.status(500).send("Internal server error");
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

module.exports = { findAll, insertArtifact, findByName, findByRFID };
