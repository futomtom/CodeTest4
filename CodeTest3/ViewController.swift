//
//  ViewController.swift
//  CodeTest3
//
//  Created by alexfu on 3/17/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
     var items:[Item]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "orders-mobileteam.qa"
        WebService.GetData { (success, result) -> Void in
            if (success){
                self.items=result!
                self.tableView.reloadData()
            }
        }
    }



    @IBAction func onDecline(sender: AnyObject) {
        let btn=sender as! UIButton
     
        items.removeAtIndex(btn.tag)
        tableView.reloadData()
    }

    
    @IBAction func onAcceptorTakeScreener(sender: AnyObject) {
        let btn=sender as! UIButton
        let item=items[btn.tag]
        if item.screener?.nextQuestion?.question?.length > 0 {
            if let vc = storyboard?.instantiateViewControllerWithIdentifier("takeVC") as? TakeViewController
            {
                vc.item=item
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else {
            if let vc = storyboard?.instantiateViewControllerWithIdentifier("acceptVC") as? AcceptViewController
            {
                vc.item=item
                self.navigationController?.pushViewController(vc, animated: true)
            }}
    }
}

extension ViewController {
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if items[indexPath.row].state == "reserved" {
            return 160
        }
        else {
            return 200
        }
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if items[indexPath.row].state == "reserved" {
            let cell = tableView.dequeueReusableCellWithIdentifier("reservedcell", forIndexPath: indexPath) as! ReservedCell
            cell.reference_id.text = items[indexPath.row].referenceId
            return cell
        } else {
            let item=items[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier("listcell", forIndexPath: indexPath) as! ListCell
            cell.DeclineButton.tag = indexPath.row
            cell.Acceptbutton.tag = indexPath.row
            if item.screener?.nextQuestion?.question?.length > 0 {
                cell.Acceptbutton.setTitle(" Take Screener ", forState: .Normal)
            }else {
                cell.Acceptbutton.setTitle(" Accept ", forState: .Normal)
            }
            
            cell.reference_id.text = item.referenceId
            return cell
            
        }

        
        
    }
     
    
}

