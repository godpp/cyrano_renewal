//
//  LoginResultVO.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 4..
//  Copyright © 2018년 갓거. All rights reserved.
//

import ObjectMapper

class LoginResultVO : Mappable{
    
    var user_id : Int?
    var nickname : String?
    var email : String?
    var password : String?
    var ink : Int?
    var registration_time : String?
    var lastlogin_time : String?
    var profile_picture : String?
    var level : Int?
    var gender : Int?
    var age : Int?
    var current_badge : Int?
    var push_token : String?
    var introduce : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user_id <- map["user_id"]
        nickname <- map["nickname"]
        email <- map["email"]
        password <- map["password"]
        ink <- map["ink"]
        registration_time <- map["registration_time"]
        lastlogin_time <- map["lastlogin_time"]
        profile_picture <- map["profile_picture"]
        level <- map["level"]
        gender <- map["gender"]
        age <- map["age"]
        current_badge <- map["current_badge"]
        push_token <- map["push_token"]
        introduce <- map["introduce"]
    }
}
