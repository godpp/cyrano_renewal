//
//  NetworkModel.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 4..
//  Copyright © 2018년 갓거. All rights reserved.
//

import Foundation

class NetworkModel {
    
    var view : NetworkCallback
    
    
    init(_ vc : NetworkCallback){
        self.view = vc
    }
    
    let baseURL = "http://13.124.155.211:3000"
}
