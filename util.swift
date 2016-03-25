//
//  util.swift
//  CodeTest2
//
//  Created by alexfu on 3/13/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import Foundation
import UIKit

//UIView
public extension String
{
    var length: Int {
        get {
            return self.characters.count
        }
    }
}

extension UIImage {
    
    public func cropToSquare() -> UIImage {
        let cropSize = min(size.width, size.height)
        let x: CGFloat
        let y: CGFloat
        
        switch imageOrientation {
        case .Left, .Right:
            x = size.height
            y = size.width
        default:
            x = size.width
            y = size.height
        }
        
        let cropSquare = CGRect(x: (x - cropSize) / 2.0, y: (y - cropSize) / 2.0, width: cropSize, height: cropSize)
        
        return UIImage(CGImage: CGImageCreateWithImageInRect(CGImage, cropSquare)!, scale: scale, orientation: imageOrientation)
    }
    
}

extension UIImageView {
    
    func kf_setFitViewWithURL(url: NSURL) {
        
        let placeholder = UIImage(named: "list-image-placeholder")
        
        self.kf_setImageWithURL(url, placeholderImage: placeholder, optionsInfo:nil) { (image, error, cacheType, imageURL) -> () in
            if let image = image {
                self.image = image.cropToSquare()
            }
        }
    }
}
