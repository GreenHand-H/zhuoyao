const express=require('express');
const pool=require('../pool.js');
var router=express.Router();


router.get('/all',(req,res)=>{
	var obj=req.query;
	console.log(obj);
	if(obj.news_sort=='最新'){
		console.log(1);
		pool.query('select * from news order by news_date desc Limit 0,10',(err,result)=>{
			if(err) throw err;
			console.log(result);
			res.send(result);
		})
	}else{
		console.log(2);
	pool.query('select * from news where  news_sort=? order by news_date desc',[obj.news_sort],(err,result)=>{
		if(err) throw err;
		console.log(result);
		res.send(result);
	})
	}
});






module.exports=router;