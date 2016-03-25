//
//  MyNavigationController.swift
//  SwiftSideMenu
//
//  Created by Evgeny Nazarov on 30.09.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class MyNavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {
    public var menuVC:MenuViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mystoryboard = UIStoryboard(name: "Main", bundle: nil)
        menuVC = mystoryboard.instantiateViewControllerWithIdentifier("menuvc") as? MenuViewController

        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menuVC, menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        //sideMenu?.bouncingEnabled = false
        //sideMenu?.allowPanGesture = false
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }
    
    // MARK: - Navigation
    public override func setOriginalImageURL(url:String) {
        self.sideMenu?.toggleMenu()
       let rootViewController = self.viewControllers.first as! MainViewController
        rootViewController.imageURL = url
    
    }

 
    
   
}
