const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

router.get('/all',(req,res)=>{
	var obj=req.query;
	console.log(obj);
	pool.query('select * from strategy where state_sort=? order by state_date desc',[obj.state_sort],(err,result)=>{
		if(err) throw err;
		console.log(result);
		res.send(result);
			
	});
});

module.exports=router;                        