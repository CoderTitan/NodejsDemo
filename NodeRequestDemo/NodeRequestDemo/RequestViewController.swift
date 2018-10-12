//
//  RequestViewController.swift
//  NodeRequestDemo
//
//  Created by quanjunt on 2018/10/12.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {

    /// 页面的请求类型
    var type: ViewType = .http
    
    @IBOutlet weak var requestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        switch type {
        case .http:
            httpRequest()
        case .expressGet:
            expressGetReuqest()
        case .expressPost:
            expressPostReuqest()
        case .getParams:
            getParamsRequest()
        case .postParams:
            postParamsRequest()
        default:
            break
        }
    }
}


// MARK: 数据请求---对应的url改成你自己的IP地址
extension RequestViewController {
    /// http请求
    fileprivate func httpRequest() {
        NetworkTool.requestString(.get, URLString: "http://192.168.2.39:3030") { (str) in
            self.requestLabel.text = str
            print(str)
        }
    }
    
    /// expressn模块的get请求
    fileprivate func expressGetReuqest() {
        NetworkTool.requestString(.get, URLString: "http://localhost:4040") { (str) in
            self.requestLabel.text = str
            print(str)
        }
    }
    
    /// expressn模块的post请求http://localhost:4040/
    fileprivate func expressPostReuqest() {
        NetworkTool.requestString(.post, URLString: "http://localhost:4040") { (str) in
            self.requestLabel.text = str
            print(str)
        }
    }
    
    /// get带参数请求
    fileprivate func getParamsRequest() {
        NetworkTool.requestString(.get, URLString: "http://localhost:4040/get", parameters: ["name": "titan", "age": "10"]) { (str) in
            self.requestLabel.text = str
            print(str)
        }
    }
    
    /// post带参数请求
    fileprivate func postParamsRequest() {
        NetworkTool.requestData(.post, URLString: "http://localhost:5050/post", parameters: ["name": "titan", "age": "10"]) { (data) in
            print(data)
        }
    }
}


enum ViewType: String {
    case http = "HTTP请求"
    case expressGet = "expressn模块的get请求"
    case expressPost = "expressn模块的post请求"
    case getParams = "get带参数请求"
    case postParams = "post带参数请求"
    case other = "请他请求"
}
