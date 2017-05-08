//
//  PlayViewController.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/19/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {

    var showId: String = "Unknown showId"
    var showTitle: String = "Unknown showTitle"
    var showName: String = "Unknown Name"
   
    // timer - used to increment progress
    var progTimer: Timer?
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    
    @IBOutlet weak var imgPlay: UIImageView!
    @IBOutlet weak var btnSlider: UISlider!
    @IBOutlet weak var btnVolume: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblElapsed: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    
    @IBOutlet weak var playProgBar: UIProgressView!
    
    var pc = PlayControl()
    var playTime: CMTime = CMTime(seconds: 0, preferredTimescale: 0)
    let TAG = "PlayView: "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(TAG, "\(showId)")
        print(TAG, "\(showTitle)")
        print(TAG, "Volume value \(btnSlider.value)")
        lblTitle.text = showTitle
        pc.playRemoteFile(musicFile: showName)
        pc.setVolume(value: btnSlider.value)
        setDuration()
        startProgress();
    }
    
    @IBAction func btnPlayClicked(_ sender: UIButton) {
        
        let playImage: UIImage = UIImage(named: "play50.png")!
        let pauseImage: UIImage = UIImage(named: "pause50.png")!
        
        if (true == pc.isPlaying())
        {
            btnPlay.setImage(playImage, for: UIControlState.normal)
            pc.pause()
            playTime = pc.getCurrentTime()
        }
        else
        {
            btnPlay.setImage(pauseImage, for: UIControlState.normal)
            pc.resumePlay()
        }
    }

    @IBAction func btnBackClicked(_ sender: Any) {
        pc.back15()
    }
    
    @IBAction func btnForwardClicked(_ sender: Any) {
        pc.forward15()
    }
    
    @IBAction func btnVolumeClicked(_ sender: Any) {
        // TODO: move from mute, soft, medium to loud based on volume position.
        
    }
    
    @IBAction func btnSliderClicked(_ sender: UISlider) {
        // TODO: increase or decrease the volume based on slider position.
        let selectedValue = Float(sender.value)
        pc.setVolume(value: selectedValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setDuration()
    {
        let dTotalSeconds = lrint(CMTimeGetSeconds(pc.getDuration()))
        
        let dHours = Int(dTotalSeconds / 3600)
        let dMinutes = Int(dTotalSeconds % 3600) / 60
        let dSeconds = Int(dTotalSeconds % 60)
        
        if (dHours > 0)
        {
           lblDuration.text = String(format: "%i:%02i:%02i", abs(dHours), abs(dMinutes), abs(dSeconds))
        }
        else
        {
           lblDuration.text = String(format: "%02i:%02i", abs(dMinutes), abs(dSeconds))
        }
    }
    
    private func updateElapsedTime()
    {
        let dTotalSeconds = lrint(CMTimeGetSeconds(pc.getCurrentTime()))
        
        let dHours = Int(dTotalSeconds / 3600)
        let dMinutes = Int(dTotalSeconds % 3600) / 60
        let dSeconds = Int(dTotalSeconds % 60)
        
        if (dHours > 0)
        {
            lblElapsed.text = String(format: "%i:%02i:%02i", abs(dHours), abs(dMinutes), abs(dSeconds))
        }
        else
        {
            lblElapsed.text = String(format: "%02i:%02i", abs(dMinutes), abs(dSeconds))
        }
    }
    
    private func startProgress()
    {
        
       // progTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: updateElapsedTime, userInfo: nil, repeats: true )
        progTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            
            self.updateElapsedTime()
        })
        
        RunLoop.current.add(progTimer!, forMode: RunLoopMode.defaultRunLoopMode)
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
