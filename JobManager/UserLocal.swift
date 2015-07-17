//
//  UserLocal.swift
//  JobManager
//
//  Created by Jerry Jiang on 17/7/15.
//  Copyright (c) 2015 Jerry Jiang. All rights reserved.
//

import Foundation
import CoreData

@objc(UserLocal)
class UserLocal: NSManagedObject {

    @NSManaged var userName: String
    @NSManaged var userPassword: String
    @NSManaged var userToken: String
    @NSManaged var isRemembered: NSNumber

}
