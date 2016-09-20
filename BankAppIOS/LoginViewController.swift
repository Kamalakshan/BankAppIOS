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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var isOk = true
        
        if (textField != self.userName && self.userName.isEqual("")) {
            isOk = false
            
        }else if(textField != self.passWord && self.passWord.isEqual("")) {
            isOk = false
        }else if(range.location == 0 && string.isEmpty  ) {
            isOk = false
        }
        
        if(isOk) {
            self.loginPress.isEnabled = true
            self.loginPress.alpha = 1
        }else {
            self.loginPress.isEnabled = false
            self.loginPress.alpha = 0.4
        }
        
        return true

    }
  

}

