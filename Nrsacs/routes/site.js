var express = require('express');
var mysql = require('mysql');
var router = express.Router();
var dbconnector = require('dbconnect');


/* GET home page. */
router.get('/site', function(req, res, next) {
  res.render('site', { title: 'Site' });
});


/* GET home page. */
router.get('/sites', function(req, res, next) {
  var siteRows = [];
  query = "SELECT * FROM SITE";
	dbconnector.query(query, function(err,rows,fields){
	if (!err) {
			console.log("Showing All sites on screen:");
			for (var i of rows) {
					siteRows.push(JSON.parse(JSON.stringify(i)));	
			}
			console.log(siteRows);
			res.render('site', {title:'All Sites', records:siteRows});
		}else{
		    console.log('Error while performing Query.: '+ err);
		}
	});

});


router.get('/site/create', function(req, res, next) {
  res.render('siteCreate', { title: 'Create a site:' });
});

router.post('/site/create', function(req, res, next) {

var data = {
    shortName: req.body.shortName,
    addressLine1: req.body.addressLine1,
    addressLine1: req.body.addressLine2,
    city: req.body.city,
    state: req.body.state,
    zipcode: req.body.zipcode,
    phoneNumber: req.body.phoneNumber
};


var squery = "INSERT INTO SITE SET ?";
 console.log(req.body);

  dbconnector.query(squery,data,function(err,rows,fields){
  	if(!err){
  		res.send("Record Added Successfully: "+req.body);
  	}else{
  		res.send("Error: "+ err);
  	}
  });

});

router.put('/site/:site_id/update', function(req, res, next) {
  res.render('site', { title: 'Site update' });
});

router.get('/site/:site_id/edit', function(req, res, next) {
  res.render('site', { title: 'Site update' });
});


router.delete('/site/:site_id/delete', function(req, res, next) {
  res.render('site', { title: 'Site delete' });
});




module.exports = router;