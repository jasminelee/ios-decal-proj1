//
//  MasterTableViewController.swift
//  To do list
//
//  Created by Jasmine Lee on 10/9/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        self.tableView.reloadData()
    ////        print(UserDefaults.standard.array(forKey: "itemList"))
    //    }
    
    var toDoItems:NSMutableArray = NSMutableArray()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        print(type(of: defaults.object(forKey: "itemList")!))
        //        print(type(of: defaults.object(forKey: "itemList"), viewDidAppear))
        //        print(defaults.object(forKey: "itemList"), "viewdidAppear")
        let itemListFromDefaults:NSMutableArray? = (defaults.object(forKey: "itemList") as? NSArray)?.mutableCopy() as? NSMutableArray
        print(itemListFromDefaults, "viewDidAppear")
        if (itemListFromDefaults != nil) {
            toDoItems = itemListFromDefaults!
        }
        
        self.tableView.reloadData()
    }
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    //    }
    
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
        return toDoItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        let toDoItem:NSDictionary = toDoItems.object(at: indexPath.row) as! NSDictionary
        cell.textLabel?.text = (toDoItem.object(forKey: "itemTitle") as! String)
        if toDoItem.object(forKey: "itemStatus") as! String == "incomplete" {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        
        toDoItems = ((UserDefaults.standard.object(forKey: "itemList") as? NSArray)?.mutableCopy() as? NSMutableArray)!
        
        let toDoItem:NSMutableDictionary = (toDoItems.object(at: indexPath.row) as! NSMutableDictionary)

        if toDoItem.object(forKey: "itemStatus") as! String == "incomplete" {
            cell?.accessoryType = .checkmark
            changeItemStatus(toDoItem, markComplete: true)
        } else {
            cell?.accessoryType = .none
            changeItemStatus(toDoItem, markComplete:  false)
        }
        print(UserDefaults.standard.object(forKey: "itemList"))
    }
    
    func changeItemStatus(_ oldToDoItem: NSMutableDictionary, markComplete: Bool) {
        print("change item status")
        let defaults = UserDefaults.standard
        
        var itemList:NSMutableArray? = (defaults.value(forKey: "itemList") as? NSArray)?.mutableCopy() as? NSMutableArray
        
        let newMutableList:NSMutableArray? = NSMutableArray()
        
        for dict in itemList! {
            if dict as! NSMutableDictionary == oldToDoItem {
                let newToDo = NSMutableDictionary()
                newToDo.setValue(oldToDoItem.object(forKey: "itemTitle"), forKey: "itemTitle")
                newToDo.setValue(oldToDoItem.object(forKey: "itemNote"), forKey: "itemNote")
                if markComplete {
                    newToDo.setValue("complete", forKey: "itemStatus")
                } else {
                    newToDo.setValue("incomplete", forKey: "itemStatus")
                }
                newMutableList!.add(newToDo)
            } else {
                newMutableList!.add(dict as! NSMutableDictionary)
            }
        }
        
        defaults.removeObject(forKey: "itemList")
        defaults.set(newMutableList, forKey: "itemList")
        defaults.synchronize()
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
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
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
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
