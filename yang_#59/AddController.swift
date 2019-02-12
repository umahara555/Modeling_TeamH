//
//  AddController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/01/17.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit
var TodoKobetsunonakami = [String]()

class AddController: UIViewController {
    @IBAction func TodoAddButton(_ sender: Any) {
        TodoKobetsunonakami.append(TodoTextField.text!)
        TodoTextField.text = ""
        UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
        
    }
    
    @IBOutlet weak var TodoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
