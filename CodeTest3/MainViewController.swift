//
//  ViewController.swift
//  SwiftSideMenu
//
//  Created by Evgeny on 03.08.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import Kingfisher

class MainViewController: UIViewController, ENSideMenuDelegate ,UIScrollViewDelegate{
    var imageLoaded:Bool=false
    var scrollDisable:Bool=false
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollTopConstaint: NSLayoutConstraint!
    
    
    var imageURL:String = "" {
        didSet {
            // print("\(imageURL)")
            weak var weakSelf = self
            imageView.kf_setImageWithURL(NSURL(string: imageURL)!,
                                         placeholderImage: nil,
                                         optionsInfo: nil,
                                         progressBlock: nil,
                                         completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            if let download = image {
                                                weakSelf!.imageLoaded = true
                                                 weakSelf!.image = download
                                                print("downloaded")
                                                weakSelf!.setupScrollView()
                                                weakSelf!.view.setNeedsLayout()
                                            } else {
                                                weakSelf!.imageLoaded = false
                                            }
            })
            
        }
    }

    
    var topBarHidden:Bool=true
    var sideMenuOpened:Bool=false
    var image = UIImage()
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.sideMenuController()?.sideMenu?.delegate = self
        
     //   setTopbarHidden(topBarHidden)
        scrollView.delegate = self
        let singleFingerTap = UITapGestureRecognizer(target: self, action: #selector(MainViewController.handleSingleTap(_:)))
        self.view.addGestureRecognizer(singleFingerTap)
    }
    
    func setupScrollView() {

        let imgSize = image.size
        let w=imgSize.width
        let h=imgSize.width
        
        let screenW = screenSize.width
        let screenH = screenSize.height
        scrollView.contentSize=imgSize
  /*
        scrollView.layer.borderColor=UIColor .redColor().CGColor
        scrollView.layer.borderWidth=1
        
        imageView.layer.borderColor=UIColor .blueColor().CGColor
        imageView.layer.borderWidth=2
    */
        print("w=\(w), h=\(h)")
        print("sw=\(screenW), sh=\(screenH)")
        
        if (w < screenSize.width) && (h < screenSize.height)
        {
            print("none")
            topConstraint.active = false
            centerXConstraint.active=true
            centerYConstraint.active=true
            
            scrollDisable = true
        } else if (w > screenSize.width) && (h > screenSize.height )
        {
            print("bothXY")
            topConstraint.active = true
            topConstraint.constant = topBarHidden ? 66:0
            centerXConstraint.active=false
            centerYConstraint.active=false
            
            scrollDisable = false
            scrollView.contentOffset = CGPoint(x: (w-screenSize.width)/2, y: (h+screenSize.height)/2)
            
            imageView.frame = CGRect(origin: CGPoint(x: 0,y: 0), size: imgSize)
        }else if (w > screenSize.width) && (h < screenSize.height) //only w
        {
            print("onlyW")
            topConstraint.active = false
            centerXConstraint.active=false
            centerYConstraint.active=false
            
            scrollDisable = false
            scrollView.contentOffset = CGPoint(x: (w+screenSize.width)/2, y: 0)
            let y = screenH - h / 2
            imageView.frame = CGRect(origin: CGPoint(x: 0,y: y), size: imgSize)
            
        }else if (w < screenSize.width) && (h > screenSize.height )  //only h
        {
            print("onlyH")
            topConstraint.active = true
            topConstraint.constant = topBarHidden ? 66:0
            centerXConstraint.active=false
            centerYConstraint.active=false
           
            
            scrollDisable = false
            scrollView.contentOffset = CGPoint(x: 0, y: (h+screenSize.height)/2)
            let x = screenW - w / 2
            imageView.frame = CGRect(origin: CGPoint(x: x,y: 0), size: imgSize)
        }
    }
    
 
 
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if imageLoaded == false || scrollDisable {
            return
        }
        
        
        let pos = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y)
        let buttomRight = CGPoint(x: scrollView.contentSize.width-screenSize.width, y: scrollView.contentSize.height-screenSize.height)
        
       // print("=\(pos.x), y=\(pos.y)")
    
        if (pos.x <= -1)
        {
            
            self.scrollView.contentOffset=CGPoint(x: 0,y: pos.y)
            
        }
        
        if (scrollView.contentOffset.y <= -1)
        {
            
            self.scrollView.contentOffset=CGPoint(x: pos.x,y: 0)
        }
        
        if (scrollView.contentOffset.y > buttomRight.y)
        {
            self.scrollView.contentOffset=CGPoint(x: pos.x,y: buttomRight.y)
        }
        
        if (scrollView.contentOffset.x > buttomRight.x )
        {
            self.scrollView.contentOffset=CGPoint(x: buttomRight.x,y: pos.y)
        }
 
    }
    
    
    
    func handleSingleTap(sender: UITapGestureRecognizer){
        if (!sideMenuOpened) {
            setTopbarHidden(topBarHidden)
            
        }
    }
    
    func setTopbarHidden(hidden:Bool)
    {
        UIApplication.sharedApplication().statusBarHidden = hidden
        self.navigationController?.navigationBarHidden = hidden
        topBarHidden = !hidden
       //  scrollTopConstaint.constant = hidden ?0:66
        
        if(scrollDisable) {
            print("center")
            topConstraint.active = false
            centerXConstraint.active=true
            centerYConstraint.active=true
            let temprc = scrollView.bounds
            scrollView.bounds = CGRect(x: 0, y: 0, width: temprc.width, height: temprc.height)
        }
        else {
            topConstraint.active = true
           
           // topConstraint.constant = hidden ?0:-66
            centerXConstraint.active=false
            centerYConstraint.active=false
            
        }
    }
    


    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
         sideMenuOpened=true
    }
    
    func sideMenuWillClose() {
        sideMenuOpened=false
        setTopbarHidden(true)

        
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }

}

