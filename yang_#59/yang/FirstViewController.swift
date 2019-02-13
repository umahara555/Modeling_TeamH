//
//  FirstViewController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/01/17.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoKobetsunonakami.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        
        return TodoCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
             TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

