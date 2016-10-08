//
//  ViewController.swift
//  To do list
//
//  Created by Jasmine Lee on 10/8/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "To Do List"

        collectionView?.backgroundColor = UIColor.white
        
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}

