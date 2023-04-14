const express = require("express");
const router = express.Router();
const user = require("./controllers/userController");
const museum = require("./controllers/museumController");
const event = require("./controllers/eventController");
const artifact = require("./controllers/artifactController");

router.get("/user/getUsers", (req, res) => {
  user.findAll(req, res);
});

router.post("/user/login", (req, res) => {
  user.login(req, res);
});

router.post("/user/register", (req, res) => {
  user.register(req, res);
});

router.get("/museum/getMuseums", (req, res) => {
  museum.findAll(req, res);
});

router.get("/museum/:name", (req, res) => {
  museum.findByName(req, res);
});

router.get("/museum/:city", (req, res) => {
  museum.findByCity(req, res);
});

router.post("/museum/insertMuseum", (req, res) => {
  museum.insertMuseum(req, res);
});

router.get("/event/getEvent", (req, res) => {
  user.findAll(req, res);
});

router.post("/event/insertEvent", (req, res) => {
  event.insertEvent(req, res);
});

router.get("/artifact/getArtifacts", (req, res) => {
  user.findAll(req, res);
});

router.get("/artifact/:name", (req, res) => {
  artifact.findByName(req, res);
});

router.post("/artifact/insertArtifact", (req, res) => {
  artifact.insertArtifact(req, res);
});

module.exports = router;
