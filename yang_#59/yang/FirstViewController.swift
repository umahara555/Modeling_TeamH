//
//  FirstViewController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/01/17.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit
struct Gethw : Codable{
    var id: Int
    var name: String
}

class FirstViewController:
UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var Gethw: UITableView!
    
    var gethw:[Gethw] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoKobetsunonakami.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        
        return TodoCell
    }
    
    func fetchTodo() {
        var apiurl:String = "http://0.0.0.0:8000/api/"
        if UserDefaults.standard.object(forKey: "OptionList") != nil{
            apiurl  = UserDefaults.standard.object(forKey: "OptionList") as! String
        }
        let url: URL  = URL(string: apiurl+"users/")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
//                self.gethw = try JSONDecoder().decode([Gethw].self, from: jsonData)
//                DispatchQueue.main.async {
//                    self.Gethw.reloadData()
//                }
            } catch {
                print(error.localizedDescription)
            }
            
        })
        task.resume()
    }
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodo()
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
             TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

