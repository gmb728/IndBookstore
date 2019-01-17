//
//  BookstoresTableViewCell.swift
//  IndBookstore
//
//  Created by Chang Sophia on 1/17/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class BookstoresTableViewCell: UITableViewCell {
    
    var name: [String] = []
    var address: [String] = []
    var openTime: [String] = []
    var phone: [Int] = []
    var email: [String] = []
    var website: [String] = []
     

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
