//
//  PlayViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/19/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    var showId: String = "Unknown showId"
    var showTitle: String = "Unknown showTitle"
    var showName: String = "Unknown Name"
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    
    @IBOutlet weak var imgPlay: UIImageView!
    @IBOutlet weak var btnSlider: UISlider!
    @IBOutlet weak var btnVolume: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("PlayView: \(showId)")
        print("PlayView: \(showTitle)")
    }
    
    @IBAction func btnPlayClicked(_ sender: Any) {
    }

    @IBAction func btnBackClicked(_ sender: Any) {
    }
    
    @IBAction func btnForwardClicked(_ sender: Any) {
    }
    
    @IBAction func btnVolumeClicked(_ sender: Any) {
    }
    
    @IBAction func btnSliderClicked(_ sender: Any) {
    }
    
    /*func playRemoteFile() {
        
        let fileUrl = "http://www.JohnnieRuffin.com/audio" + showName
        let url = NSURL(string: fileUrl)
        
        var myPlayer = AVPlayer(URL: url)
        myPlayer.play()
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
