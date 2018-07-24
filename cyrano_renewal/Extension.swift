//
//  Extension.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 4..
//  Copyright © 2018년 갓거. All rights reserved.
//

import Foundation
import UIKit

// MARK: 로그인뷰 TextField 밑줄
extension UITextField {
    func addBorderBottom(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height-height, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}

extension UIViewController{
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
