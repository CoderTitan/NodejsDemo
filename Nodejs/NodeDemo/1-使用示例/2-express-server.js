

/* express的服务器 */

//1. 导入express
var express = require('express')

//2. 创建express服务器, 默认是当前的IP地址
var server = express()

//3. 访问服务器(get或者post)
//参数一: 请求根路径
//3.1 get请求
server.get('/', function (request, response) {
    consol2e.log("收到get请求")

    response.send('get请求成功')
})

//3.2 post请求
server.post('/', function (request, response) {
    console.log("收到post请求")
    response.send('post请求成功')
})

//4. 绑定端口
server.listen(4040)
console.log('启动4040')