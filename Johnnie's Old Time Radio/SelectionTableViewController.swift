//
//  SelectionTableViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/21/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class SelectionTableViewController: UITableViewController {

    var showId: String = "Unknown Id"
    var showTitle: String = "Unknown Title"
    var showName: String = "Unknown Name"
    var titles: [String?] = []
    var titleName: [String?] = []
    let cellIdentifier = "SelectionTableViewCell"
    var segue: UIStoryboardSegue?
    var rt = RadioTitle()
    var ut = Utility()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        print("ShowId: \(showId)")
        
        for (showTitle, showName) in rt.burnsAllenTitles {
            titleName.append(showTitle)
            titles.append(showName)
            //print("\(showTitle): \(showName)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var titleCount: Int = 0
        
        if (showId == rt.showId[0])
        {
            titleCount = rt.burnsAllenTitles.count
            print("BurnsAllenTitle Count: \(rt.burnsAllenTitles.count)")
        }
        
        return titleCount
    }
    
    func playClicked(sender: UIButton)
    {
        showTitle = titles[sender.tag]!
        showName = titleName[sender.tag]!
        
        print("Title in Label: \(showTitle)")
        
        performSegue(withIdentifier: "segPlay", sender: self)
    
    }
    
    func delClicked(sender: UIButton)
    {
       // print("delClicked: \(titles[sender.tag])")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SelectionTableViewCell
        
       // let title = ut.findKeyForValue(value: rt.burnsAllenTitles.values[indexPath.row], dictionary: rt.burnsAllenTitles)
        
        cell!.lblTitle.text = titles[indexPath.row]
        
        // set the delete/download image
        // TODO: set the delete/download image based on whether it has been downloaded.
        cell!.btnDel.setImage(UIImage(named: "ic_download.png"), for: UIControlState.normal)
        
        // set the cloud image
        // TODO: Set the cloud button to appear only if the mp3 has been downloaded.
        cell!.btnCloud.isHidden = false
        
        // setup play button actions
        cell!.btnPlay.addTarget(self, action: #selector(SelectionTableViewController.playClicked), for: .touchUpInside)
        
        // setup download/del button actions
        cell!.btnDel.addTarget(self, action: #selector(SelectionTableViewController.delClicked), for: .touchUpInside)
        
        
        // Configure the cell...

        return cell!
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SelectionTableViewCell
        
        // var mytitle: String = rt.burnsAllenTitles.index(forKey: titles[indexPath.row])
        let svc = segue!.destination as! PlayViewController
        
        showTitle = titles[indexPath.row]!
        svc.showId = showId
        svc.showTitle = showTitle
        
        print("Title in Label: \(showTitle)")
        
        performSegue(withIdentifier: "PlayViewController", sender: "SelectionViewController")
    }*/
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segPlay")
        {
            print("In Segue transition!!")
            let svc = segue.destination as! PlayViewController
            
            svc.showId = showId
            svc.showTitle = showTitle
            svc.showName = showName
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
