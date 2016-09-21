//
//  ViewController.swift
//  BankAppIOS
//
//  Created by frankie on 16/9/20.
//  Copyright © 2016年 frankie. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var loginPress: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loginPress.isEnabled = false
        self.loginPress.alpha = 0.4
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(response.request!)")  // original URL request
            print("response:\(response.response!)") // HTTP URL response
            print("data:\(response.data!)")     // server data
            print("result:\(response.result)")   // result of response serialization
            
            
            if let JSON = response.result.value {
                //print("JSON: \(JSON) \n\n")
                let reponse =  JSON as! NSDictionary
                //print("junny\n")
                print(reponse.object(forKey: "origin"))
                let headers = reponse.object(forKey: "headers") as! NSDictionary
                let host = headers.object(forKey: "Host") as! String
                print("host = \(host)")
            }
        }
        let testuserLogin  = UserLogin(foruserName:"name", forpassWord:"pass",fordevno:"123")
        testuserLogin.login()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear: \(textField.text)  ")
        
        self.loginPress.isEnabled = false
        self.loginPress.alpha = 0.4
        
        return true
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        var isOk = true
        if(textField != self.userName && self.userName.text == "") {
            isOk = false
        }else if (textField != self.passWord && self.passWord.text == "") {
            isOk = false
        }else if(range.location == 0 && string == "") {
            isOk = false
        }
        print(textField.text);
        print("string: \(string)")
        print("range.length:\(range.length), range.location:\(range.location)")
        
        if(isOk) {
            self.loginPress.isEnabled = true
            self.loginPress.alpha = 1
        }else{
            self.loginPress.isEnabled = false
            self.loginPress.alpha = 0.4
        }
        return true;
    }
    

}

