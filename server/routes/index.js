const express = require("express");
const router = express.Router();

const { upload } = require("../middleware/uploadImage");

const { auth, authAdmin } = require("../middleware/auth");

const { login, register, cekAuth } = require("../controllers/auth");

// const { getUser, deleteUser } = require("../controllers/user");

const {
  getSong,
  addSong,
  getDetailSong,


} = require("../controllers/song");

const {
  getArtist,
  addArtist,

} = require("../controllers/artist");

const {
  addTransaction,
  getTransaction,
  editTransaction,
  deleteTransaction,
} = require("../controllers/transaction");


router.post("/register", register);
router.post("/login", login);
router.get("/auth", auth, cekAuth);

// // Film Routes
router.get("/song", getSong);
router.get("/song/:id", getDetailSong);
router.post("/song", upload("thumbnail"), addSong);


// Category Routes
router.get("/artist", getArtist);
router.post("/artist", auth, addArtist);


router.get("/transaction", getTransaction);
router.post("/transaction", auth, upload("attache"), addTransaction);
router.patch("/transaction/:id", auth, authAdmin, editTransaction);
// router.delete("/transaction/:id", auth, authAdmin, deleteTransaction);

// // Episode Routes
// router.post("/episode", auth, authAdmin, upload("thumbnailFilm"), addEpisode);
// router.get("/film/:id/episodes", auth, authAdmin, getEpisodesByFilm);
// router.get("/episodes/:idEpisode", auth, authAdmin, getDetailEpisode);
// router.patch("/episode/:id", auth, authAdmin, editEpisode);
// router.delete("/episode/:id", auth, authAdmin, deleteEpisode);

router.get("*", function (req, res) {
  res.status(404).send({
    error: "404 Not Found",
  });
});

module.exports = router;
