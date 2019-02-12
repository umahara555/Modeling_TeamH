//
//  APIController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/01/20.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit

struct Article : Codable{
    var id: Int
    var name: String
}

class APIController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    @IBOutlet weak var TodoCell: UITableViewCell!

    @IBOutlet weak var tableview: UITableView!
    
    var articles:[Article] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "apicell",for: indexPath)
        cell.textLabel!.text = articles[indexPath.row].name
        return cell
    }
    @IBAction func Reload(_ sender: Any) {
        fetchTodo()
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
                self.articles = try JSONDecoder().decode([Article].self, from: jsonData)
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
            
        })
        task.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodo()
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
