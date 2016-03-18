//
//  TakeViewController.swift
//  CodeTest3
//
//  Created by alexfu on 3/18/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit
import CheckboxButton

class TakeViewController: UIViewController {
     var item:Item!

    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var Answer1: UILabel!
    
    @IBOutlet weak var Answer2: UILabel!
    
    @IBOutlet weak var checkbox1: CheckboxButton!
    
    @IBOutlet weak var checkbox2: CheckboxButton!
    
   
    @IBAction func check2tap(sender: AnyObject) {
        let checkbtn = sender as! CheckboxButton
        if checkbtn.on && checkbox1.on {
            checkbox1.on = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Question.text = item.screener?.nextQuestion?.question
        Answer1.text = item.screener?.nextQuestion?.answers![0].text
        Answer2.text = item.screener?.nextQuestion?.answers![1].text
        
    // Do any additional setup after loading the view.
    }
    
    
    @IBAction func check1tap(sender: AnyObject) {
        let checkbtn = sender as! CheckboxButton
        if checkbtn.on && checkbox2.on {
            checkbox2.on = false
        }
    }
}
