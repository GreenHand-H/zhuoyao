const express=require('express');
const bodyParser=require('body-parser');
const newsRouter=require('./routers/news.js');
const strategyRouter=require('./routers/strategy.js');
const spriteRouter=require("./routers/sprite.js");
// const cors=require("cors");

var server=express();
server.listen(3000);
// server.use(cors());
server.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1')
    res.header("Content-Type", "application/json;charset=utf-8");
    next();
});


server.use(bodyParser.urlencoded({
	extended:false
}));

server.use(express.static('public'));

server.use('/news',newsRouter);
server.use('/strategy',strategyRouter);
server.use('/sprite',spriteRouter);


