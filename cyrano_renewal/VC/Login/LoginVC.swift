//
//  LoginVC.swift
//  cyrano_renewal
//
//  Created by 갓거 on 2018. 6. 2..
//  Copyright © 2018년 갓거. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate, NetworkCallback {
    
    @IBOutlet var loginLogoImageView: UIImageView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginStackViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet var loginStackView: UIStackView!
    
    var check = true
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력하세요.", attributes: [NSAttributedStringKey.foregroundColor:UIColor.init(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)])
        emailTextField.addBorderBottom(height: 1.0, color: UIColor.init(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0))
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력하세요.", attributes: [NSAttributedStringKey.foregroundColor:UIColor.init(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)])
        passwordTextField.addBorderBottom(height: 1.0, color: UIColor.init(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0))
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
    }
    
    @IBAction func joinButtonAction(_ sender: Any) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldReceive touch: UITouch
        ) -> Bool {
        if(touch.view?.isDescendant(of: loginStackView))!{
            return false
        }
        return true
    }
    @objc func handleTap_mainview(_ sender: UITapGestureRecognizer?){
        self.loginStackView.becomeFirstResponder()
        self.loginStackView.resignFirstResponder()
    }
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "3"{
            
        } else if code == "1"{
            if let msg = resultData as? String{
                simpleAlert(title: "오류", msg: msg)
            }
        } else if code == "2"{
            if let msg = resultData as? String{
                simpleAlert(title: "오류", msg: msg)
            }
        } else if code == "4"{
            if let msg = resultData as? String{
                simpleAlert(title: "오류", msg: msg)
            }
        } else if code == "5"{
            if let msg = resultData as? String{
                simpleAlert(title: "오류", msg: msg)
            }
        }
    }
    
    func networkFailed() {
        simpleAlert(title: "오류", msg: "인터넷 연결을 확인해주세요.")
    }
    
}
extension LoginVC {
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(keyboardWillShow),
            name: .UIKeyboardWillShow,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(keyboardWillHide),
            name: .UIKeyboardWillHide,
            object: nil
        )
    }
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if check {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey]
                as? NSValue)?.cgRectValue {
                loginStackViewCenterYConstraint.constant = -(keyboardSize.height)+100
                check = false
                loginLogoImageView.isHidden = true
                view.layoutIfNeeded()
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey]
            as? NSValue)?.cgRectValue {
            loginStackViewCenterYConstraint.constant = 0
            check = true
            loginLogoImageView.isHidden = false
            view.layoutIfNeeded()
        }
    }
}
