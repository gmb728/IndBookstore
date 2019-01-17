//
//  BookstoresTableViewController.swift
//  IndBookstore
//
//  Created by Chang Sophia on 1/17/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class BookstoresTableViewController: UITableViewController {
    var name: [String] = []
    var address: [String] = []
    var openTime: [String] = []
    var phone: [String] = []
    var facebook: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr = "https://cloud.culture.tw/frontsite/trans/emapOpenDataAction.do?method=exportEmapJson&typeId=M".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, respose, error) in
            if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
               
                DispatchQueue.main.async{
                    
                    for bookstore in dic {
                        self.name.append(bookstore["name"] as! String)
                    }
                    for bookstore in dic {
                        self.address.append(bookstore["address"] as! String)
                    }
                    for bookstore in dic {
                        self.openTime.append(bookstore["openTime"] as! String)
                    }
                    for bookstore in dic {
                        self.phone.append(bookstore["phone"] as! String)
                    }
                    for bookstore in dic {
                        if let facebook = bookstore["facebook"]  as? String {
                            self.facebook.append(facebook)
                        }
                    }
                    print(self.name)
                    self.tableView.reloadData()
            
        }
    }
 }
    task.resume()
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailController = segue.destination as? DetailTableViewController
        if let row = tableView.indexPathForSelectedRow? .row {
            let bookstore: [Any] = [name[row], address[row], openTime[row], phone[row], facebook[row]]
            
            detailController?.bookstore = bookstore
        }
}
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let name = self.name[indexPath.row]
        let address = self.address[indexPath.row]
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = address
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreCell", for: indexPath)
        
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return name.count
}
}
