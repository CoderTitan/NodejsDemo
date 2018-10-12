//
//  NetworkTools.swift
//  GYJTV
//
//  Created by 田全军 on 2017/4/21.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case post
    case get
}

class NetworkTool {
    class func requestString(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result: String) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, encoding: JSONEncoding.default).responseData { (response) in
            
            // 3.获取结果
            guard let data = response.data else {
                print(response.error!)
                return
            }
            
            let resultStr = String(data: data, encoding: String.Encoding.utf8)
            // 4.将结果回调出去
            finishedCallback(resultStr ?? "")
        }
    }
    
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
}
