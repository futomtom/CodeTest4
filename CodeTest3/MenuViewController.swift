//
//  ViewController.swift
//  CodeTest3
//
//  Created by alexfu on 3/17/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit
import Kingfisher



class MenuViewController: UITableViewController {
     var items:[Item]=[]
     var selectedMenuItem : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        WebService.GetData { (success, result) -> Void in
            if (success){
                self.items=result!
                self.tableView.reloadData()
                }
            }
    }
}

extension MenuViewController {

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
            return 80
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

            let item=items[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier("menucell", forIndexPath: indexPath) as! menuCell
            if let thumb = item.thumb
            {
                cell.thumbView.kf_setFitViewWithURL(NSURL(string: thumb)!)
  
            } else{
                cell.thumbView.image = UIImage(named: "list-image-placeholder")
            }
            if let caption = item.caption
            {
                cell.caption.text = caption
            } else
            {
                cell.caption.text = ""
            }
            if (item.original) == nil
            {
            cell.userInteractionEnabled = false            
            }
        
            return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = indexPath.row

        sideMenuController()?.setOriginalImageURL(items[indexPath.row].original!)
      //for test small Original
      //  sideMenuController()?.setOriginalImageURL(items[indexPath.row].thumb!)
    }

}




