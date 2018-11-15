//
//  ViewController.swift
//  ToDo
//
//  Created by 上原由宇駆 on 2018/11/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedTodo: Int!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = todoList[indexPath.row]
        return TodoCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell：", indexPath.row, " todoList：", todoList[indexPath.row])
        
        self.selectedTodo = indexPath.row
        if self.selectedTodo != nil {
            performSegue(withIdentifier: "toDeleteController", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDeleteController") {
            let deleteController: DeleteController = (segue.destination as? DeleteController)!
            deleteController.indexPathRow = self.selectedTodo
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todoList = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }


}

