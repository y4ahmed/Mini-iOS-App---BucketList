//
//  BucketListTableViewCell.swift
//  BucketList
//
//  Created by Yusuf Ahmed on 9/24/17.
//  Copyright © 2017 Yusuf Ahmed. All rights reserved.
//



import UIKit

class BucketListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
