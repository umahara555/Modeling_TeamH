//
//  ViewController.swift
//  ToDo
//
//  Created by 上原由宇駆 on 2018/11/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = todoList[indexPath.row]
        return TodoCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todoList = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }


}

