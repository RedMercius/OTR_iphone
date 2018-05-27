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
    var dc = DownloadControl()
    let TAG = "SelectionTableViewController: "
    
    // struct shows { BurnsAndAllen: Int = 0, BobHope, FibberMcGee, Gildersleeves, MartinAndLewis, NightBeat, Speed, Whistler, DimensionX, XMinusOne, HopalongCassidy, FortLaramie,JackBenny, InnerSanctum }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        navigationItem.title = showId
        populateShow()
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
        
        if ( showId == rt.showId[0] )
        {
            titleCount = rt.burnsAllenTitles.count
            print("BurnsAllenTitle Count: \(rt.burnsAllenTitles.count)")
        }
        if (showId == rt.showId[1])
        {
            titleCount = rt.bobHopeTitles.count
            print("BobHopeTitle Count: \(rt.bobHopeTitles.count)")
        }

        if (showId == rt.showId[2])
        {
            titleCount = rt.fibberTitles.count
            print("Fibber McGee Title Count: \(rt.fibberTitles.count)")
        }

        if (showId == rt.showId[3])
        {
            titleCount = rt.gildersleevesTitles.count
            print("GildersleevesTitle Count: \(rt.gildersleevesTitles.count)")
        }

        if (showId == rt.showId[4])
        {
            titleCount = rt.martinAndLewisTitles.count
            print("MartinAndLewisTitle Count: \(rt.martinAndLewisTitles.count)")
        }

        if (showId == rt.showId[5])
        {
            titleCount = rt.nightBeatTitles.count
            print("NightBeatTitle Count: \(rt.nightBeatTitles.count)")
        }

        if (showId == rt.showId[6])
        {
            titleCount = rt.speedGibsonTitles.count
            print("SpeedGibsonTitle Count: \(rt.speedGibsonTitles.count)")
        }

        if (showId == rt.showId[7])
        {
            titleCount = rt.theWhistler.count
            print("TheWhistlerTitle Count: \(rt.theWhistler.count)")
        }

        if (showId == rt.showId[8])
        {
            titleCount = rt.dimensionXTitles.count
            print("DimensionXTitle Count: \(rt.dimensionXTitles.count)")
        }
        
        if (showId == rt.showId[9])
        {
            titleCount = rt.xminusOneTitles.count
            print("XminusOneTitle Count: \(rt.xminusOneTitles.count)")
        }
        if (showId == rt.showId[10])
        {
            titleCount = rt.hopalongCassidyTitles.count
            print("hopalongCassidyTitle Count: \(rt.hopalongCassidyTitles.count)")
        }
        if (showId == rt.showId[11])
        {
            titleCount = rt.fortLaramieTitles.count
            print("fortLaramieTitle Count: \(rt.fortLaramieTitles.count)")
        }
        if (showId == rt.showId[12])
        {
            titleCount = rt.jackBennyTitles.count
            print("JackBennyTitle Count: \(rt.jackBennyTitles.count)")
        }
        if (showId == rt.showId[13])
        {
            titleCount = rt.innerSanctumTitles.count
            print("InnerSanctumTitle Count: \(rt.innerSanctumTitles.count)")
        }
        return titleCount
    }
    
    func populateShow()
    {
        switch (showId)
        {
        case "BurnsAndAllen":
            for (showTitle, showName) in rt.burnsAllenTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "Bob Hope":
            for (showTitle, showName) in rt.bobHopeTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "Fibber McGee":
            for (showTitle, showName) in rt.fibberTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "Gildersleeves":
            for (showTitle, showName) in rt.gildersleevesTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "MartinAndLewis":
            for (showTitle, showName) in rt.martinAndLewisTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "NightBeat":
            for (showTitle, showName) in rt.nightBeatTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "Speed":
            for (showTitle, showName) in rt.speedGibsonTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "Whistler":
            for (showTitle, showName) in rt.burnsAllenTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "DimensionX":
            for (showTitle, showName) in rt.dimensionXTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "XMinusOne":
            for (showTitle, showName) in rt.xminusOneTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "Hopalong Cassidy":
            for (showTitle, showName) in rt.hopalongCassidyTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "FortLaramie":
            for (showTitle, showName) in rt.fortLaramieTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
        case "JackBenny":
            for (showTitle, showName) in rt.jackBennyTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        case "InnerSanctum":
            for (showTitle, showName) in rt.innerSanctumTitles {
                titleName.append(showTitle)
                titles.append(showName)
            }
            break
        default:
            break
        }
    }
    
    @objc func playClicked(sender: UIButton)
    {
        showTitle = titles[sender.tag]!
        showName = titleName[sender.tag]!
        
        // print("Title in Label: \(showTitle) Sender: \(sender.tag)")
        
        performSegue(withIdentifier: "segPlay", sender: self)
    }
    
    @objc func delClicked(sender: UIButton)
    {
        // TODO: Check for file to delete. If does not exist, download.
        // TODO: If downloading, remove line item.
        
        if (isFileDownloaded(showTitle: titleName[sender.tag]!))
        {
            // TODO: delete the current file
        }
        else
        {
            // set the file for download
            print(TAG + "File started for download \(titleName[sender.tag]!)")
        
            let config = URLSessionConfiguration.background(withIdentifier: titleName[sender.tag]!)
            let session = URLSession(configuration: config, delegate: self as? URLSessionDelegate, delegateQueue: OperationQueue())
            dc.downloadFile(path: titleName[sender.tag]!, showId: showId, session: session)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SelectionTableViewCell
        
        // set the title for the cell
        cell!.lblTitle.text = titles[indexPath.row]
        cell!.btnPlay.tag = indexPath.row
        
        // set the delete/download image
        if (isFileDownloaded(showTitle: titleName[indexPath.row]!))
        {
            // set the delete image
            cell!.btnDel.setImage(UIImage(named: "ic_delete.png"), for: UIControlState.normal)
            
            // set the cloud image
            cell!.btnCloud.isHidden = false
        }
        else
        {
            // set the download image
            cell!.btnDel.setImage(UIImage(named: "ic_download.png"), for: UIControlState.normal)
            
            // set the cloud image
            cell!.btnCloud.isHidden = true
        }
        
        // TODO: check if it is currently being downloaded
        // TODO: if currently being download, remove play button and download/delete button
        // TODO: Add a download progress bar and "Downloading" text
        // TODO: Always update progress bar based on background session
        // TODO: Handle any download errors gracefully.
        
        // setup play button actions
        cell!.btnPlay.addTarget(self, action: #selector(SelectionTableViewController.playClicked), for: .touchUpInside)
        
        // setup download/del button actions
        cell!.btnDel.addTarget(self, action: #selector(SelectionTableViewController.delClicked), for: .touchUpInside)
        
        // Configure the cell...
        return cell!
    }
    
    private func isFileDownloaded(showTitle: String) -> Bool
    {
        // TODO: check if the file has been downloaded.
        let path = NSSearchPathForDirectoriesInDomains(.musicDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let filePath = url.appendingPathComponent(showTitle)?.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath!) {
            print(TAG + "FILE AVAILABLE: \(showTitle)")
            return true
        } else {
            print(TAG + "FILE NOT AVAILABLE: \(showTitle)")
            return false
        }
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
