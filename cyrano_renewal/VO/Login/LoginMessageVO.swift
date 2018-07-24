//
//  LoginMessageVO.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 4..
//  Copyright © 2018년 갓거. All rights reserved.
//

import ObjectMapper

class LoginMessageVO : Mappable{
    
    var message : String?
    var result : LoginResultVO?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
        result <- map["result"]
    }
}
