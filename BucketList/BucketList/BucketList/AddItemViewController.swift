//
//  AddItemViewController.swift
//  BucketList
//
//  Created by Yusuf Ahmed on 9/24/17.
//  Copyright © 2017 Yusuf Ahmed. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var nameDisplay: UITextField!
    @IBOutlet weak var latitudeDisplay: UITextField!
    @IBOutlet weak var longitudeDisplay: UITextField!
    @IBOutlet weak var descDisplay: UITextField!
    @IBOutlet weak var dateDisplay: UIDatePicker!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //tap background to close out of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

    
    // MARK: Segue
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (self.latitudeDisplay.text?.characters.count == 0) {
            return;
        }
        if (self.longitudeDisplay.text?.characters.count == 0) {
            return;
        }
        if (self.nameDisplay.text?.characters.count == 0) {
            return;
        }
        if (self.descDisplay.text?.characters.count == 0) {
            return;
        }
        
        if (segue.identifier == "unwindFromAddID") {
            if let svc = segue.destination as? BucketListTableViewController {
                
                let item = BucketItem(name: "nameU", desc: "descU", latitude:5.22, longitude: 3.14, date: Date())
                item.name = self.nameDisplay.text!
                item.latitude = Double(self.latitudeDisplay.text!)!
                item.longitude = Double(self.longitudeDisplay.text!)!
                item.desc = self.descDisplay.text!
                item.date = self.dateDisplay.date
                svc.bucketItems += [item]
                //sort by date
                svc.bucketItems.sort(by: { $0.date < $1.date })
                //sort by isdone
                svc.bucketItems.sort(by: { (leftProfile, rightProfile) -> Bool in
                    return leftProfile.isdone != true && rightProfile.isdone == true
                })
                
                svc.tableView.reloadData()
                
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
