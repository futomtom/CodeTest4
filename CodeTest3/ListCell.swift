//
//  ListViewCell.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit



class ListCell: MaterialTableViewCell {
    
  
    @IBOutlet weak var cardview: UIView!
    @IBOutlet weak var Acceptbutton: UIButton!
    @IBOutlet weak var DeclineButton: UIButton!
    @IBOutlet weak var reference_id: UILabel!


    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
       
        Acceptbutton.backgroundColor=UIColor(red:0.969,  green:0.753,  blue:0.235, alpha:1)
        Acceptbutton.titleLabel?.adjustsFontSizeToFitWidth = true

        self.Acceptbutton.layer.shadowColor=UIColor.darkGrayColor().CGColor
        self.Acceptbutton.layer.shadowOffset=CGSize(width: 2, height: 2)
        self.Acceptbutton.layer.shadowOpacity=0.6
        self.Acceptbutton.layer.cornerRadius=5
        
        self.cardview.layer.cornerRadius=5
        
    }
}
