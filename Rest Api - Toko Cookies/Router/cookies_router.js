"use strict";
const router = require("express").Router();
const Controller = require("../Controller/cookies_controller");
router.post("/add", (req, res) => {
  Controller.add(req.body)
    .then((result) => res.json(result))
    .catch((err) => res.json(err));
});
//get data
router.get("/get", (req, res) => {
  Controller.get(req.body)
    .then((result) => res.json(result))
    .catch((err) => res.json(err));
});

//delete data
router.delete("/delete/:id", Controller.delete);

//update
router.put("/update/:id", Controller.update);

module.exports = router;