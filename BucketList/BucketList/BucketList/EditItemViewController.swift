//
//  EditItemViewController.swift
//  BucketList
//
//  Created by Yusuf Ahmed on 9/24/17.
//  Copyright © 2017 Yusuf Ahmed. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    var nameToDisplay = "None"
    var latToDisplay = 0.0
    var longToDisplay = 0.0
    var descToDisplay = "None"
    var dateToDisplay = Date()
    var index = 0

    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = nameToDisplay
        latitudeField.text = String(format:"%f", latToDisplay)
        longitudeField.text = String(format:"%f", longToDisplay)
        descriptionField.text = descToDisplay
        dateField.date = dateToDisplay

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tap background to closeout of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    // MARK: Segue
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "unwindFromEditID") {
            if let svc = segue.destination as? BucketListTableViewController {
                
                let item = svc.bucketItems[index]
                item.name = self.nameField.text!
                item.latitude = Double(self.latitudeField.text!)!
                item.longitude = Double(self.longitudeField.text!)!
                item.desc = self.descriptionField.text!
                item.date = self.dateField.date
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

}
