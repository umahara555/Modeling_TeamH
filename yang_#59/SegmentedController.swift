//
//  SegmentedController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/01/20.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit

class SegmentedController: UIViewController {

   
    @IBOutlet weak var testLabel: UILabel!
    
    
    @IBAction func segmentfunction(_ sender: Any) {
    //セグメント番号で条件分岐させる
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            testLabel.text = "おはようございます。"
        case 1:
            testLabel.text = "こんにちは"
        case 2:
            testLabel.text = "こんばんは"
        default:
            print("該当無し")
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
