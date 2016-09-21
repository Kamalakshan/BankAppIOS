//
//  userLogin.swift
//  BankAppIOS
//
//  Created by frankie on 16/9/21.
//  Copyright © 2016年 frankie. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserLogin {
    var userName : String = ""
    var passWord : String = ""
    var devno : String = ""
    
    init(foruserName userName : String, forpassWord passWord : String, fordevno devno:String) {
        self.userName = userName
        self.passWord = passWord
        self.devno = devno
    }
    
    func login() {
        if(userName != "" && passWord != "" && devno != "") {
            var jsonDate : JSON = [ "request":[
            [ "loginname":userName, "password":passWord, "devno": devno]
            ]]
            print(jsonDate)
        }
    }
}
