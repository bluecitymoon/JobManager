//
//  FirstViewController.swift
//  JobManager
//
//  Created by Jerry Jiang on 17/7/15.
//  Copyright (c) 2015 Jerry Jiang. All rights reserved.
//

import UIKit
import SwiftyJSON

public class JobListViewController: UIViewController {
    
    public var jobs: [AutomaticJob]=[]
    
    @IBOutlet var jobTableView: UITableView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTableView.dataSource = self
        jobTableView.delegate = self
        
        for i in 1...20 {
            
            let jobOne = AutomaticJob()
            jobOne.jobName = "大润发\(i)"
            
            jobs.append(jobOne)
        }
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension JobListViewController: UITableViewDataSource {
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let automaticJob: AutomaticJob = jobs[indexPath.row]
        
        let singleCell: JobCell = tableView.dequeueReusableCellWithIdentifier("SingleJobCell") as! JobCell
        singleCell.jobName.text = automaticJob.jobName
        
        return singleCell
    }
}

extension JobListViewController: UITableViewDelegate {
    
}