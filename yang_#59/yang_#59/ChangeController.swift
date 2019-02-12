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
var IDbox = [String]()
var PATHbox = [String]()
class ChangeController: UIViewController {
    
    @IBOutlet weak var ChangeField: UITextField!
    @IBOutlet weak var ChanheField_2: UITextField!
    @IBAction func ChangeButton(_ sender: Any) {
        if ChangeField.text != "" && ChanheField_2.text != ""{
            self.performSegue(withIdentifier: "TodoChange", sender: nil)
            
        }
        IDbox.append(ChangeField.text!)
        PATHbox.append(ChanheField_2.text!)
        
        UserDefaults.standard.set( IDbox, forKey: "IDList" )
        UserDefaults.standard.set( PATHbox, forKey: "PATHList" )
        post()
    }
    
    func post() {
        let params:[String:Any] = [
            "name": self.ChangeField.text!,
            "password": self.ChanheField_2.text!
        ]
        
        let str = ChangeField.text!
        let strData = str.data(using: String.Encoding.utf8)
        
        let url = NSURL(string: "http://0.0.0.0:8000/api/users/")
        var request = URLRequest(url: url! as URL)
        
        request.httpMethod = "POST"
        request.httpBody = strData
        
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
