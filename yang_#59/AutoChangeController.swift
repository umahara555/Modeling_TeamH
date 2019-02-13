//
//  AutoChangeController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/02/14.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit

class AutoChangeController: UIViewController {
    @IBAction func SegueButton(_ sender: Any) {
        auto()
    }
    
    func auto(){
        if UserDefaults.standard.object(forKey: "user_id") != nil{
            self.performSegue(withIdentifier: "home", sender: nil)
        }else{
            self.performSegue(withIdentifier: "login", sender: nil)
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
