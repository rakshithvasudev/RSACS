var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var  dbconnector = require('dbconnect');


/* GET home page. */
router.get('/site', function(req, res, next) {
  res.render('site', { title: 'Site' });
});


/* GET home page. */
router.get('/sites', function(req, res, next) {
  res.render('site', { title: 'All Sites' });
  dbconnector.connect();
	dbconnector.query("SELECT * FROM SITE", function(err,rows,fields){
	if (!err) {
			console.log("Done!");
			console.log(rows);
		}else{
		    console.log('Error while performing Query.: '+ err);
		}
	});

	dbconnector.end();
});

router.post('/site/create', function(req, res, next) {
  res.render('site', { title: 'Site create with post' });
});

router.put('/site/:site_id/update', function(req, res, next) {
  res.render('site', { title: 'Site update' });
});

router.delete('/site/:site_id/delete', function(req, res, next) {
  res.render('site', { title: 'Site delete' });
});




module.exports = router;