

// JavaScript中的数组, 字典, 和自定义对象等相关语法
// 参考: https://www.titanjun.top/categories/JavaScript%E7%AC%94%E8%AE%B0/

var arr = [1, 2, 3, 'A', true]

console.log(arr)

//1. 导入express
var express = require('express')

//2. 创建express服务器, 默认是当前的IP地址
var server = express()

//3. 访问服务器(get或者post)
server.get('/', function (request, response) {

    console.log("收到get请求")

    response.send(arr)
})


//4. 绑定端口
server.listen(4040)
console.log('启动4040')





IP: 寻找对应的设备(手机)
端口: 寻找程序
