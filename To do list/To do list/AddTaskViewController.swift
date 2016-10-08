//
//  AddTaskViewController.swift
//  To do list
//
//  Created by Jasmine Lee on 10/8/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import Foundation
import UIKit

class AddTaskViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    func addNewTask(taskName: String) {
//        tasks.append(newElement: String)
        collectionView?.reloadData()
    }
    
    var viewController: ViewController?
    
    
}
