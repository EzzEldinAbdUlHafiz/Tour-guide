const mongoose = require("mongoose");

const artifactSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  museum: {
    type: String,
    required: true,
  },

  description: {
    type: String,
    required: true,
  },
  image: {
    type: [String],
    required: true,
  },

  video: {
    type: String,
    required: true,
  },
});

const Artifact = mongoose.model("Artifact", artifactSchema);
module.exports = Artifact;
