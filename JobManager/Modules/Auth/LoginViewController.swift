//
//  LoginViewController.swift
//  JobManager
//
//  Created by Jerry Jiang on 22/7/15.
//  Copyright (c) 2015 Jerry Jiang. All rights reserved.
//

import Foundation
import UIKit

public class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var loginService = LoginService()
    
    private var isLoggedIn: Bool = false
    
    @IBAction func performLogin(sender: UIButton) {

        if let username = self.usernameTextField.text, let password = passwordTextField.text {
            
            if username.isEmpty || password.isEmpty {
                
                alertUserToInputUsernameOrPassword()
                
            } else {
                
                let response : Response = loginService.getToken(username, password: password) as Response
                
                println(response)
                //performSegueWithIdentifier("GoToJobListSegue", sender: nil)
            }
            
        } else {
            alertUserToInputUsernameOrPassword()
        }
        
    }
    
    private func alertUserToInputUsernameOrPassword() {
        
        var alertViewController = UIAlertController(title: "登录失败", message: "用户名或密码未填写", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertViewController.addAction(okAction)
        presentViewController(alertViewController, animated: true, completion: nil)
    }

}