//
//  AddTaskViewController.swift
//  To do list
//
//  Created by Jasmine Lee on 10/9/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        print("Button tapped")
        let defaults = UserDefaults.standard
        
        var itemList:NSMutableArray? = defaults.value(forKey: "itemList") as? NSMutableArray
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setValue(titleTextField.text, forKey: ("itemTitle" as NSCopying) as! String)
        dataSet.setValue(notesTextView.text, forKey: ("itemNote" as NSCopying) as! String)
        dataSet.setValue("incomplete", forKey: ("itemStatus" as NSCopying) as! String)
        
        print("Title is \(titleTextField.text) and description is \(notesTextView.text)")
        
        if (itemList != nil) { // data available
            let newMutableList:NSMutableArray? = NSMutableArray()
            
            for dict in itemList! {
                newMutableList!.add(dict as! NSMutableDictionary)
            }
            
            defaults.removeObject(forKey: "itemList")
            newMutableList!.add(dataSet)
            defaults.set(newMutableList, forKey: "itemList")
            
        } else { // first todo item in list
            defaults.removeObject(forKey: "itemList")
            itemList = NSMutableArray()
            itemList!.add(dataSet)
            defaults.set(itemList, forKey: "itemList")
        }
        defaults.synchronize()
        self.navigationController!.popToRootViewController(animated: true)
        print("finished pressing Done", defaults.value(forKey: "itemList"))
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
