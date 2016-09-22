//
//  UserLogin.swift
//  BankAppIOS
//
//  Created by frankie on 16/9/21.
//  Copyright © 2016年 frankie. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class UserLogin {
    var userName : String = ""
    var passWord : String = ""
    var devno : String = ""
    
    init (userName : String, passWord : String, devno:String) {
        self.userName = userName
        self.passWord = passWord
        self.devno = devno
    }
    
    func login() {
        if(userName != "" && passWord != "" && devno != "") {
            
            let jsonDate : Parameters = [ "request": ["loginname":userName, "password":passWord.md5, "devno": devno]]
            
            //print(jsonDate)
            //let urlString = "http://10.205.28.75:10080/appLogin"
            let urlString = "http://api.jirengu.com/weather.php?callback=getWeather"
          
          
            
            Alamofire.request(urlString, method:.get, parameters: [:], encoding: JSONEncoding.default)
                .validate()
                .responseJSON { response in
                    debugPrint(response)
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data!)     // server data
                    print(response.result)   // result of response serialization


                    if let ret = response.result.value{
                        print("JSON: \(ret)") //具体如何解析json内容可看下方“响应处理”部分
                    }
            }
//            Alamofire.request(urlString, method: .post, parameters: jsonDate, encoding: JSONEncoding.default)
//                .response(queue: DispatchQueue.utility) { progress in
//                    print("Progress: \(progress.fractionCompleted)")
//                }
//                .validate { request, response, data in
//                    // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
//                    return .success
//                }
//                .responseJSON { response in
//                    debugPrint(response)
//            }
            //Alamofire.request(urlString, method: .post, parameters:jsonDate,encoding: JSONEncoding.default)
            
//           try  Alamofire.upload(jsonDate.rawData(), to: urlString).response { response in // method defaults to `.post`
//                debugPrint(response)
//            }
            

            
        }
    }
}
