//
//  AcceptViewController.swift
//  CodeTest3
//
//  Created by alexfu on 3/18/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit

class AcceptViewController: UIViewController {

    var item:Item!
    @IBOutlet weak var is_for_recruitment: UILabel!
    @IBOutlet weak var operating_systems: UILabel!

    @IBOutlet weak var introduction: UILabel!
    @IBOutlet weak var is_moderated: UILabel!
    
     @IBOutlet weak var OSLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        is_for_recruitment.text = boolToString(item.isForRecruitment)
       
        
        let os = item.operatingSystems?.joinWithSeparator(",\n")
        operating_systems.numberOfLines=(item.operatingSystems?.count)!
        OSLabel.numberOfLines=(item.operatingSystems?.count)!
        operating_systems.text = os
       
        introduction.text = item.introduction
        is_moderated.text = boolToString(item.isModerated)
    }
    
    func boolToString(value: Bool?) -> String
    {
        guard let value = value
            else
        {
            return "<None>"
            // or you may return nil here. The return type would have to be String? in that case.
        }
        
        return "\(value)"
    }

}
