//
//  BucketItem.swift
//  BucketList
//
//  Created by Yusuf Ahmed on 9/24/17.
//  Copyright © 2017 Yusuf Ahmed. All rights reserved.
//

import Foundation

class BucketItem {
    
    var name: String = "New Item"
    var desc: String = ""
    var latitude:Double = 0.0
    var longitude: Double = 0.0
    var date: Date
    var isdone: Bool = false
    
    
    init(name: String, desc: String, latitude:Double, longitude: Double, date: Date) {
        self.name = name
        self.desc = desc
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        self.isdone = false
    }
    
}
