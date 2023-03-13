const mongoose = require("mongoose");

const eventSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  location: {
    type: String,
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
  eventDate: {
    type: String,
    required: true,
  },

});

const Event = mongoose.model("Event", eventSchema);
module.exports = Event;
