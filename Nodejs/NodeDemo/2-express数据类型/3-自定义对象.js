

// 自定义对象

function User(name, age) {
    // 属性
    this.name = name;
    this.age = age;


    // 定义方法
    // this.eat = function () {
    //     console.log('吃东西楼')
    // }
}



// 返回自定义对象
var user = new User('jun', 12)

console.log(user)

//1. 导入express
var express = require('express')

//2. 创建express服务器, 默认是当前的IP地址
var server = express()

//3. 访问服务器(get或者post)
server.get('/', function (request, response) {

    console.log("收到get请求")

    response.send(user)
})


//4. 绑定端口
server.listen(4040)
console.log('启动4040')