//
//  LoginService.swift
//  JobManager
//
//  Created by Jerry Jiang on 22/7/15.
//  Copyright (c) 2015 Jerry Jiang. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class LoginService {
    
    public func getToken(username: String, password: String) -> Response {
        
        var response = Response()
        
        let headers = [
            "Authorization": "Basic eW9qbWJhcHA6bXlTZWNyZXRPQXV0aFNlY3JldA==",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let parameters = [
            "username": username, "password": password,"grant_type": "password","scope": "read write","client_secret": "mySecretOAuthSecret","client_id": "yojmbapp"
        ]
        
        Alamofire.request(.POST, "http://localhost:8080/oauth/token", parameters: parameters,  headers: headers).validate()
            .responseJSON { _, _, json, error in
                
                println(json)
                
                if error == nil {
                    
                    let token = self.getValueInResponseObject(json, key: "access_token")
                    response.message = token
                    
                    self.saveTokenToCoreData(username, password: password, token: token)
                    
                } else {
                    
                    response.type = "fail"
                    response.message = self.getValueInResponseObject(json, key: "error_description")
                }
        }
        
        return response
    }
    
    private func getValueInResponseObject(object: AnyObject?, key: String) -> String {
        
        if let value = object?.valueForKey(key) as? String {
            return value
        }

        return ""
    }
    
    private func saveTokenToCoreData(username: String, password: String, token: String) {
        
    }
}
