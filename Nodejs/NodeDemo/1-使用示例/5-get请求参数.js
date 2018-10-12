

/* express的中间件 */

//1. 导入express
var express = require('express')

//2. 创建express服务器
var server = express()

//4. 访问服务器(get或者post)
//参数一: 请求根路径
//4.1 get请求
server.get('/get', function (request, response) {
    // 解析get请求参数, 参数都是定好的参数
    // 参数都在request.query中
    console.log(request.query)


    var str = "{ name: " + request.query['name'] + ", " + "age: " + request.query['age'] + "}"
    response.send('get参数请求成功, \n请求参数为: ' + str)
})

//5. 绑定端口, 监听服务器
server.listen(4040)
console.log('启动4040')


