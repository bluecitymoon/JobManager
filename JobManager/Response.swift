//
//  Response.swift
//  JobManager
//
//  Created by Jerry Jiang on 22/7/15.
//  Copyright (c) 2015 Jerry Jiang. All rights reserved.
//

import Foundation

public class Response {
    
    public enum Type : String {
        case SUCCESS = "成功", FAIL = "失败"
    }
    
    public var type = Type.SUCCESS.rawValue
    
    public var message = ""
}