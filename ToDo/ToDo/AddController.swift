//
//  AddController.swift
//  ToDo
//
//  Created by 上原由宇駆 on 2018/11/15.
//

import UIKit

var todoList = [String]()

class AddController: UIViewController {

    @IBOutlet weak var TodoTextField: UITextField!
    
    @IBAction func TodoAddButton(_ sender: Any) {
        todoList.append(TodoTextField.text!)
        TodoTextField.text = ""
        UserDefaults.standard.set( todoList, forKey: "TodoList" )
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
