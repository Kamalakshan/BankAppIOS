//
//  ViewController.swift
//  BankAppIOS
//
//  Created by frankie on 16/9/20.
//  Copyright © 2016年 frankie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var loginPress: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // self.userName.delegate = self
        //self.passWord.delegate = self
        self.loginPress.isEnabled = false
        self.loginPress.alpha = 0.4
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
        let usernameStr:NSString = self.userName.text! as NSString
        let passwordStr:NSString = self.passWord.text! as NSString
        print(usernameStr.length , passwordStr.length)
        if(usernameStr.length < 1 || passwordStr.length < 1){
            self.loginPress.isEnabled = false
            self.loginPress.alpha = 0.4
        }else{
            self.loginPress.isEnabled = true
            self.loginPress.alpha = 1
        }
        
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        print(textField.text);
        return true;
    }
    

}

