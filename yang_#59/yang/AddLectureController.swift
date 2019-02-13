//
//  AddLectureController.swift
//  yang
//
//  Created by Hiroto Shimabukuro on 2019/02/14.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit
struct LP : Codable{
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

//var idbox = [String]()
var subbox = [String]()
var teacherbox = [String]()
var sembox = [String]()
var yearbox = [Int]()
var daybox = [String]()
var facbox = [String]()
var depbox = [String]()
var crebox = [String]()

class AddLectureController: UIViewController {
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var teacher: UITextField!
    @IBOutlet weak var semester: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var faculty: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var credit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddLecButton(_ sender: Any) {
        post()
    }
    
    
    
    
    
    
    
    func post() {
        let params = [
            "subject": subject.text,
            "teacher": teacher.text,
            "semester":semester.text,
            "year":year.text,
            "day":day.text,
            "faculty":faculty.text,
            "department":department.text,
            "credit":credit.text,
        ]
        
        //let str = name.text!
        //let strData = str.data(using: String.Encoding.utf8)
        
        
        var apiurl:String = "http://0.0.0.0:8000/api/"
        
        if UserDefaults.standard.object(forKey: "OptionList") != nil{
            apiurl  = UserDefaults.standard.object(forKey: "OptionList") as! String
        }
        let url = NSURL(string: apiurl+"lectures/")
        
        //let url = NSURL(string: "http://0.0.0.0:8000/api/users/")
        var request = URLRequest(url: url! as URL)
        
        request.httpMethod = "POST"
        //request.httpBody = strData
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if let data = data, let respons = response {
                do {
                    print("JSONSerialization")
                    let json = try JSONDecoder().decode(User.self, from: data)
                    UserDefaults.standard.set( json.id, forKey: "user_id" )
                    print(json)
                } catch {
                    print(respons)
                }
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
