var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'RSACS' });
});


router.post('/', function(req, res, next) {
  res.render('index', { title: 'RSACS' });
});





module.exports = router;
