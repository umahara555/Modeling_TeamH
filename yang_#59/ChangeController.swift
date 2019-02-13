//
//  ChangeController.swift
//  yang_#59
//
//  Created by Hiroto Shimabukuro on 2019/01/17.
//  Copyright © 2019 Hiroto Shimabukuro. All rights reserved.
//

import UIKit
struct User: Codable {
    var id: Int
    var name: String
}
var namebox = [String]()
var emailbox = [String]()
var passbox = [String]()

class ChangeController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func ChangeButton(_ sender: Any) {
        if name.text != "" && email.text != "" && password.text != ""{
            self.performSegue(withIdentifier: "TodoChange", sender: nil)
            
        }
        namebox.append(name.text!)
        emailbox.append(email.text!)
        passbox.append(password.text!)
        
        
        UserDefaults.standard.set( namebox, forKey: "nameList" )
        UserDefaults.standard.set( emailbox, forKey: "emailList" )
        UserDefaults.standard.set( passbox, forKey: "passList" )
        post()
    }
    
    func post() {
        let params = [
            "name": name.text,
            "email": email.text,
            "password": password.text
        ]
        
        //let str = name.text!
        //let strData = str.data(using: String.Encoding.utf8)
        
        
        var apiurl:String = "http://0.0.0.0:8000/api/"
        
        if UserDefaults.standard.object(forKey: "OptionList") != nil{
            apiurl  = UserDefaults.standard.object(forKey: "OptionList") as! String
        }
        let url = NSURL(string: apiurl+"users/")
        
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
