//
//  JobCell.swift
//  JobManager
//
//  Created by Jerry Jiang on 17/7/15.
//  Copyright (c) 2015 Jerry Jiang. All rights reserved.
//

import Foundation
import UIKit

public class JobCell: UITableViewCell {
    
    @IBOutlet weak var jobName: UILabel!
    @IBOutlet weak var startupButton: UIButton!
    
    @IBAction func startUpJob(sender: AnyObject) {
        
        println(jobName.text)
    }
    
}