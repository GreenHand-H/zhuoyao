const express=require('express');
const bodyParser=require('body-parser');
const newsRouter=require('./routers/news.js');
const strategyRouter=require('./routers/strategy.js');

var server=express();
server.listen(3000);

server.use(bodyParser.urlencoded({
	extended:false
}));

server.use(express.static('public'));

server.use('/news',newsRouter);
server.use('/strategy',strategyRouter);


