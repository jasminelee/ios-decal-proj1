//
//  StatsViewController.swift
//  To do list
//
//  Created by Jasmine Lee on 10/9/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var toDoItems:NSMutableArray = NSMutableArray()
    @IBOutlet weak var numLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        let itemListFromDefaults:NSMutableArray? = defaults.object(forKey: "itemList") as? NSMutableArray
        
        if (itemListFromDefaults != nil) {
            toDoItems = itemListFromDefaults!
        }
        
        var count = 0
        for dict in toDoItems {
            if (dict as! NSDictionary).value(forKey: "itemStatus") as? String == "complete" {
                count += 1
            }
        }
        
        numLabel.text = String(count)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
