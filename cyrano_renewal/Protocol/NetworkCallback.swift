//
//  NetworkCallback.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 4..
//  Copyright © 2018년 갓거. All rights reserved.
//

protocol NetworkCallback {
    
    func networkResult(resultData:Any, code:String)
    func networkFailed()
    
}
