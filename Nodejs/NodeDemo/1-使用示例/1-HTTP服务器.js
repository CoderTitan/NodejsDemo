
//创建HTTP服务器

//1. 加载http模块
var http = require('http');

//2. 创建http服务器
// 参数: 请求的回调, 当有人访问服务器的时候,就会自动调用回调函数
var server = http.createServer(function (request, response) {
    // 只要有人访问服务器就会执行
    console.log('有人访问了服务器')

    // 回调数据(显示到浏览器上面的数据)
    // response.write('Hello, My Love')
    // 结束响应
    // response.end()

    // 或者使用
    response.end("Hello, My Love")
})

//3. 绑定端口
server.listen(3030, '192.168.2.39')

//4. 执行
console.log('执行了3030')