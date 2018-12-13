//
//  DeleteController.swift
//  ToDo
//
//  Created by 上原由宇駆 on 2018/11/15.
//

import UIKit
class DeleteController: UIViewController {

    @IBOutlet weak var TodoName: UILabel!
    
    var indexPathRow:Int!
    
    @IBAction func TodoDeleteButton(_ sender: Any) {
        todoList.remove(at: indexPathRow)
        UserDefaults.standard.set( todoList, forKey: "TodoList" )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if indexPathRow != nil {
            TodoName.text = todoList[indexPathRow]
        }
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
