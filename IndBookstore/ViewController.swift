//
//  ViewController.swift
//  IndBookstore
//
//  Created by Chang Sophia on 1/17/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var bookstores: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlStr = "https://cloud.culture.tw/frontsite/trans/emapOpenDataAction.do?method=exportEmapJson&typeId=M".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                for bookstore in dic {
                    self.bookstores.append(bookstore["name"] as! String)
                }
                print(self.bookstores)
            }
        }
           task.resume()
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }


}
