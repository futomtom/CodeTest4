//
//  ListViewCell.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit



class ReservedCell: MaterialTableViewCell {
    
    @IBOutlet weak var cardview: UIView!
    @IBOutlet weak var reference_id: UILabel!
 
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.cardview.layer.cornerRadius=5
    }
}
