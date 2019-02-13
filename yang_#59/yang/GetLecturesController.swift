//
//  GetLecturesController.swift
//  yang
//
//  Created by Hiroto Shimabukuro on 2019/02/14.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit


struct Lecture : Codable{
    var id: Int
    var subject : String
    var teacher :String
    var semester :String
    var year :Int
    var day :String
    var faculty :String
    var department :String
    var credit: Int
}

class GetLecturesController: UIViewController,UITabBarDelegate,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lectures:[Lecture] = []
    var log: Int!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "leccell",for: indexPath)
        cell.textLabel!.text = lectures[indexPath.row].subject
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath){
        self.log = indexPath.row
        if self.log != nil{
            performSegue(withIdentifier: "LR", sender: nil)
        }
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
//        print("hoge")
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if (segue.identifier == "LR") {
            let registerLectureController:RegisterLectureController = (segue.destination as? RegisterLectureController)!
            registerLectureController.indexPathRow = self.log
            print(self.log)
        }
    }
    
    func fetchTodo() {
        var apiurl:String = "http://0.0.0.0:8000/api/"
        if UserDefaults.standard.object(forKey: "OptionList") != nil{
            apiurl  = UserDefaults.standard.object(forKey: "OptionList") as! String
        }
        let url: URL  = URL(string: apiurl+"lectures/")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                self.lectures = try JSONDecoder().decode([Lecture].self, from: jsonData)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
            
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self as? UITableViewDelegate
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
