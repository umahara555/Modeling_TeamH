//
//  RegisterLectureController.swift
//  yang
//
//  Created by Hiroto Shimabukuro on 2019/02/14.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit
struct LR : Codable{
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

class RegisterLectureController: UIViewController {
    
    var indexPathRow:Int!
    
    
    @IBOutlet weak var LRField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var lectures:[LR] = []
    
    
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
                self.lectures = try JSONDecoder().decode([LR].self, from: jsonData)
//                DispatchQueue.main.async {
//                    self.LRField.reloadData()
//                }
            } catch {
                print(error.localizedDescription)
            }
            
        })
        task.resume()
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
