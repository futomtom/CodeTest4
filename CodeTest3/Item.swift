//
//  Item.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper


//
//	Item.swift
//
//	Create by alex on 24/3/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated

import Foundation


class Item : Mappable{
    
    var caption : String?
    var original : String?
    var thumb : String?
    
    
    required init?(_ map: Map){}
    
    func mapping(map: Map)
    {
        caption <- map["caption"]
        original <- map["original"]
        thumb <- map["thumb"]
        
    }
    
}