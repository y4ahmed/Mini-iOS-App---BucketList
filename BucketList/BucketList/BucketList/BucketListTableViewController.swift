//
//  BucketListTableViewController.swift
//  BucketList
//
//  Created by Yusuf Ahmed on 9/24/17.
//  Copyright © 2017 Yusuf Ahmed. All rights reserved.
//
import UIKit

class BucketListTableViewController: UITableViewController {
    

    
    @IBOutlet weak var nameField: UITextField!
    
    var bucketItems = [BucketItem]()
    var count = 0
    
    func setCount(newCount: Int){
        self.count = newCount
    }
    
    func loadSampleItems() {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date1: Date = dateFormatterGet.date(from: "2018-03-19 12:24:26")!
        let date2: Date = dateFormatterGet.date(from: "2017-09-25 12:24:26")!
        let date3: Date = dateFormatterGet.date(from: "2018-05-29 12:24:26")!
        let date4: Date = dateFormatterGet.date(from: "2017-09-11 12:24:26")!
        let date5: Date = dateFormatterGet.date(from: "2014-09-29 12:24:26")!
        let date6: Date = dateFormatterGet.date(from: "2018-05-22 12:24:26")!
        
        let item1 = BucketItem(name: "Go on a hike!", desc: "Take a panoramic picture of all those trees.", latitude:1.1, longitude: 1.1, date: date1 as Date)
        bucketItems += [item1]
        let item2 = BucketItem(name: "Finish this iOS app!", desc: "It's gotta be a bucket list.", latitude:2.2, longitude: 2.2, date: date2 as Date)
        item2.isdone = true
        bucketItems += [item2]
        let item3 = BucketItem(name: "Register to graduate", desc: "Make sure you get a diploma", latitude:3.3, longitude: 3.3, date: date3 as Date)
        bucketItems += [item3]
        let item4 = BucketItem(name: "Get a Bodos Bagel first ticket!", desc: "They're delicious", latitude:4.4, longitude: 4.4, date: date4 as Date)
        bucketItems += [item4]
        let item5 = BucketItem(name: "Live in dorms", desc: "You have to do it, so..", latitude:5.5, longitude: 5.5, date: date5 as Date)
        bucketItems += [item5]
        item5.isdone = true
        let item6 = BucketItem(name: "Go to the career fair.", desc: "Go get a job.", latitude:6.6, longitude: 6.6, date: date6 as Date)
        bucketItems += [item6]
        
        //sort by date
        bucketItems.sort(by: { $0.date < $1.date })
        
        //sort by isdone
        bucketItems.sort(by: { (leftProfile, rightProfile) -> Bool in
            return leftProfile.isdone != true && rightProfile.isdone == true
        })
        
        
    }
    
    //MARK: Button Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Code for you to write!", message: "You can add code here to open a new ViewController to add a new note!", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleItems()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return bucketItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BucketListTableViewCell"
        
        //PROBLEM PROBLEM PROBLEM!!!!!!
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BucketListTableViewCell
        
        // Fetches the appropriate note for the data source layout.
        let item = bucketItems[indexPath.row]
        
        cell.nameLabel.text = item.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let convertedDate = dateFormatter.string(from: item.date)
        cell.dateLabel.text = convertedDate
        
        if(item.isdone){
            cell.backgroundColor = UIColor(
                red: 0x9c/255,
                green: 0x50/255,
                blue: 0x9c/255,
                alpha: 1.0)
        } else {
            cell.backgroundColor = .white
        }
        
        
        return cell
    }
    
    // Override to support tapping on an element in the table view.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /** let index = indexPath[1]
        let currentItem = bucketItems[index]
        let alertController = UIAlertController(title: currentItem.name, message: currentItem.desc + "\nsaved at: " + currentItem.date.description, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil) **/
        
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let rowToMove = bucketItems[fromIndexPath.row]
        bucketItems.remove(at: fromIndexPath.row)
        bucketItems.insert(rowToMove, at: fromIndexPath.row)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // Lets you add various buttons when you swipe
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        let done = UITableViewRowAction(style: .normal, title: "Done") { action, index in
            let cell = tableView.cellForRow(at: indexPath)

            let item = self.bucketItems[indexPath.row]
            
            if( cell?.isEditing )!{
                
                if( item.isdone == false) {
          
 
                    item.isdone = true
                    //sort by date
                    self.bucketItems.sort(by: { $0.date < $1.date })
                    
                    //sort by isdone
                    self.bucketItems.sort(by: { (leftProfile, rightProfile) -> Bool in
                        return leftProfile.isdone != true && rightProfile.isdone == true
                    //reloadlist
                        //self.tableView.reloadData()
                    })
                }
                else {
                    item.isdone = false
                    //sort by date
                    self.bucketItems.sort(by: { $0.date < $1.date })
                    
                    //sort by isdone
                    self.bucketItems.sort(by: { (leftProfile, rightProfile) -> Bool in
                        return leftProfile.isdone != true && rightProfile.isdone == true
                    })
                    //self.tableView.reloadData()
                }
                
                
            }
            
            self.tableView.reloadData()

            
        }
        done.backgroundColor = .green
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            
            let index = indexPath[1]
            self.setCount(newCount: index)
            self.performSegue(withIdentifier: "editItemSegue", sender: nil)
            
        }
        edit.backgroundColor = .orange
        
        
        return [done, edit]
    }
    
    
    // MARK: Segue
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editItemSegue") {
            if let svc = segue.destination as? EditItemViewController {
                
                let item = self.bucketItems[count]
                svc.nameToDisplay = item.name
                svc.latToDisplay = item.latitude
                svc.longToDisplay = item.longitude
                svc.descToDisplay = item.desc
                svc.dateToDisplay = item.date
                svc.index = count
                
                
            }
        }
        if (segue.identifier == "addItemSegue") {
            if let svc = segue.destination as? AddItemViewController {
                
           
                svc.index = bucketItems.count
                
                
            }
        }
    }
    
    
    @IBAction func unwindToBucketList(segue: UIStoryboardSegue) {
        //"unwindFromEditID"
    }
    
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
