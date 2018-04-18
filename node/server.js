
// 引入http模块,实例化
var http = require("http");
var url = require('url');
var fs  = require('fs');
var path = require('path');
// 静态文件
var express = require('express');
var app = express();

// 将图片， CSS, JavaScript 文件放在 public 目录下
app.use(express.static('public'));

app.get('/', function (req, res) {
	res.send('Hello World');
});

app.get('/swift/*', function(req, res) {
	var des_file = __dirname + '/..' + req.path + '.playground/Contents.swift';
	// res.send(des_file);
	// res.sendFile( path.resolve(des_file));

	var data = '';

	// 创建可读流
	var readerStream = fs.createReadStream(path.resolve(des_file));
	// 设置UTF8编码
	readerStream.setEncoding('UTF8');
	// 处理流事件 -->data,end,and error
	readerStream.on('data', function(chunk) {
		data += chunk;
	});

	readerStream.on('end', function(){
		console.log('end:' + data);
		res.send(data);
	});

	readerStream.on('error', function(err){
		console.log(err);
		res.send(err);
	});
});

function start (route) {
		var server = app.listen(8081, function(){
		var host = server.address().host;
		var port = server.address().port;
		console.log("应用实例，访问地址为 http://%s:%s",host,port);
	});
}

//
console.log('Server running at http://127.0.0.1:8081/');

exports.start = start;
