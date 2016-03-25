//
//  WebService.swift
//  CodeTest2
//
//  Created by alexfu on 3/12/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

import AlamofireObjectMapper





class WebService {
    
    
  
    static func GetData(completion: (success: Bool, result: [Item]?) -> Void)
    {
        let URL="http://www.crunchyroll.com/mobile-tech-challenge/images.json"

        Alamofire.request(.GET,URL)
                .validate(statusCode: 200..<300)
                .responseArray { (response: Response<[Item], NSError>) in
                    
                    if let items = response.result.value{
                        completion(success: true, result: items)
                    }
                    else {
                         completion(success: false, result: nil)
                    }
        }
    }
}
