//
//  ViewController.swift
//  NodeRequestDemo
//
//  Created by quanjunt on 2018/10/12.
//  Copyright © 2018年 quanjunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        dataArr = ["HTTP请求", "expressn模块的get请求", "expressn模块的post请求", "get带参数请求", "post带参数请求"]
        tableView.reloadData()
        
        
        
        NetworkTool.requestData(.get, URLString: "https://ifm.ximalaya.com/recsys-stream-query/recsys/daily/rec/load", parameters: ["device": "iPhone"]) { (result) in
            print(result)
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.selectionStyle = .none
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcs: [ViewType] = [.http, .expressGet, .expressPost, .getParams, .postParams]
        let vc = RequestViewController()
        vc.title = dataArr[indexPath.row]
        vc.type = vcs[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


