//
//  OptionController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/02/09.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit

class OptionController: UIViewController {
    @IBOutlet weak var OptionField: UITextField!
    var unti:String = ""
    @IBAction func OptionButton(_ sender: Any) {
        if (OptionField.text != nil){
            unti = OptionField.text!
            let url:String = "http://" + unti + ":8000/api/"
            UserDefaults.standard.set( url, forKey: "OptionList" )
        }
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
