

/* express的路由 */

//1. 导入express
var express = require('express')

//2. 创建express服务器
var server = express()

//3. 访问服务器(get或者post)
//参数一: 请求根路径
//3.1 get请求
// next: 路由句柄
server.get('/home', function (request, response, next) {

    console.log('从据库获取数据')
    next()

}, function (request, response) {

    response.send('这是请求返回的数据')

})

//3. 绑定端口
server.listen(5000)
console.log('启动5000')
