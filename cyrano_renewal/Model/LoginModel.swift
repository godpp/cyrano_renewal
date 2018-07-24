//
//  LoginModel.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 4..
//  Copyright © 2018년 갓거. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class LoginModel : NetworkModel{
    
    
    func requestLogin(email:String, password: String){
        let URL : String = "\(baseURL)/login/login"
        
        let body : [String:String] = [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<LoginMessageVO>) in
            
            switch response.result{
            case .success:
                guard let resultFromServer = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if resultFromServer.message == "3" {
                    if let result = resultFromServer.result {
                        self.view.networkResult(resultData: result , code: "3")
                        
                    }
                }
                else if resultFromServer.message == "1"{
                    self.view.networkResult(resultData: "이메일과 비밀번호를 입력해주세요.", code: "1")
                }
                else if resultFromServer.message == "2"{
                    self.view.networkResult(resultData: "존재하지 않는 계정입니다.", code: "2")
                }
                else if resultFromServer.message == "4"{
                    self.view.networkResult(resultData: "비밀번호 오류입니다.", code: "4")
                }
                else if resultFromServer.message == "5"{
                    self.view.networkResult(resultData: "커넥션 오류입니다.", code: "5")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
}
