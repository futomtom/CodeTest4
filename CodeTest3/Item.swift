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



class Item : Mappable{
    
    var createdAt : String?
    var formFactor : [String]?
    var id : Int?
    var instructions : String?
    var introduction : String?
    var isForRecruitment : Bool?
    var isModerated : Bool?
    var operatingSystems : [String]?
    var otherInstructions : String?
    var recorderType : String?
    var referenceId : String?
    var screener : Screener?
    var state : String?
    var type : String?
    var unreliableInternalState : String?
    var updatedAt : String?
    var url : String?
    var webBrowsers : [AnyObject]?
    
    
    required init?(_ map: Map){}
    
    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        formFactor <- map["form_factor"]
        id <- map["id"]
        instructions <- map["instructions"]
        introduction <- map["introduction"]
        isForRecruitment <- map["is_for_recruitment"]
        isModerated <- map["is_moderated"]
        operatingSystems <- map["operating_systems"]
        otherInstructions <- map["other_instructions"]
        recorderType <- map["recorder_type"]
        referenceId <- map["reference_id"]
        screener <- map["screener"]
        state <- map["state"]
        type <- map["type"]
        unreliableInternalState <- map["unreliable_internal_state"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        webBrowsers <- map["web_browsers"]
        
    }
    
}

class Screener : Mappable{
    
    var id : Int?
    var nextQuestion : NextQuestion?
    
    
    required init?(_ map: Map){}
    
    func mapping(map: Map)
    {
        id <- map["id"]
        nextQuestion <- map["next_question"]
        
    }
    
}

class NextQuestion : Mappable{
    
    var answers : [Answer]?
    var id : String?
    var multiAnswer : Bool?
    var question : String?
    
    
    required init?(_ map: Map){}
    
    func mapping(map: Map)
    {
        answers <- map["answers"]
        id <- map["id"]
        multiAnswer <- map["multi_answer"]
        question <- map["question"]
        
    }
    
}


class Answer : Mappable{
    
    var acceptable : Bool?
    var id : String?
    var text : String?
    
    
    required init?(_ map: Map){}
    
    func mapping(map: Map)
    {
        acceptable <- map["acceptable"]
        id <- map["id"]
        text <- map["text"]
        
    }
    
}