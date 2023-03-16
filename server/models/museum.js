const mongoose = require("mongoose");

const museumSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  address: {
    type: String,
    required: true,
  },
  artifacts: {
    type: [String],
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  image: {
    type: String,
    required: true,
  },
  openTime: {
    type: String,
    required: true,
  },
  closeTime: {
    type: String,
    required: true,
  },
  city: {
    type: String,
    required: true,
  },
});

const Museum = mongoose.model("Museum", museumSchema);
module.exports = Museum;
