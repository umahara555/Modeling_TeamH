//
//  AddController.swift
//  yang
//
//  Created by Hiroto Shimabukuro on 2018/12/18.
//  Copyright © 2018 玉橋優太朗. All rights reserved.
//

import UIKit

var YankList = [String]()
class AddController: UIViewController {

    @IBOutlet weak var YankTextField: UITextField!
    
    @IBAction func YankAddButton(_ sender: Any) {
        YankList.append(YankTextField.text!)
        YankTextField.text = ""
        UserDefaults.standard.set(YankList, forKey:"Yank")
    }
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
