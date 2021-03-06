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
        
        // navigationItem.title = "Back"
        // Do any additional setup after loading the view.
        print(TAG, "\(showId)")
        print(TAG, "\(showTitle)")
        updatePlayImage()
        lblTitle.text = showTitle
        navigationItem.title = showTitle
        pc.playRemoteFile(musicFile: showName, showId: showId)
        pc.setVolume(value: btnSlider.value)
        playProgBar.setProgress(0.0, animated: false)
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
        setVolumeButton()
    }
    
    @IBAction func btnSliderClicked(_ sender: UISlider) {
        let selectedValue = Float(sender.value)
        pc.setVolume(value: selectedValue)
        let sliderValue = Int(btnSlider.value * 10)
        
        let medium = Int(5)
        
        let muteImage: UIImage = UIImage(named: "mute32x1.png")!
        let mediumImage: UIImage = UIImage(named: "Low Volume_32x1.png")!
        let loudImage: UIImage = UIImage(named: "highvolume_32x1.png")!
        
        if (sliderValue < medium && sliderValue != 0)
        {
            // if soft, go to medium
            btnVolume.setImage(mediumImage, for: .normal)
        }
        else if (sliderValue > medium)
        {
            // if more than or equal to medium, go loud
            btnVolume.setImage(loudImage, for: .normal)
        }
        else if (sliderValue == 0)
        {
            // if soft, go to mute
            btnVolume.setImage(muteImage, for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setVolumeButton()
    {
        let medium = Int(5)
        let loud = Int(10)
        let sliderValue = Int(btnSlider.value * 10)
        
        let muteImage: UIImage = UIImage(named: "mute32x1.png")!
        let mediumImage: UIImage = UIImage(named: "Low Volume_32x1.png")!
        let loudImage: UIImage = UIImage(named: "highvolume_32x1.png")!
        
        if (sliderValue < medium)
        {
            // if mute or soft, go to medium
            btnVolume.setImage(mediumImage, for: .normal)
            btnSlider.setValue(0.5, animated: true)
            pc.setVolume(value: 0.5)
        }
        else if (sliderValue >= medium && sliderValue < loud)
        {
            // if medium, go loud
            btnVolume.setImage(loudImage, for: .normal)
            btnSlider.setValue(1.0, animated: true)
            pc.setVolume(value: 1.0)
        }
        else if (sliderValue == loud)
        {
            // if loud, go to mute
            btnVolume.setImage(muteImage, for: .normal)
            btnSlider.setValue(0.0, animated: true)
            pc.setVolume(value: 0.0)
        }
    }
    
    private func updateProgressBar()
    {
        let currentTime = pc.getCurrentTime()
        let duration = pc.getDuration()
        let playCal = Float(currentTime.seconds / duration.seconds)
        let playPercentage = (playCal)
        playProgBar.setProgress(playPercentage, animated: true)
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
        setDuration()
    }
    
    private func startProgress()
    {
        
       // progTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: updateElapsedTime, userInfo: nil, repeats: true )
        progTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            
            self.updateElapsedTime()
            self.updateProgressBar()
        })
        
        RunLoop.current.add(progTimer!, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    private func updatePlayImage()
    {
        let burnsImage: UIImage = UIImage(named: "Burns&Allen.png")!
        let bobHopeImage: UIImage = UIImage(named: "Bob Hope.png")!
        let fibberMcGeeImage: UIImage = UIImage(named: "Fibber McGee.png")!
        let gildersleeves: UIImage = UIImage(named: "Gildersleeves.png")!
        let martinAndLewis: UIImage = UIImage(named: "Martin&Lewis.png")!
        let nightBeat: UIImage = UIImage(named: "NightBeat.png")!
        let speed: UIImage = UIImage(named: "Speed.png")!
        let whistler: UIImage = UIImage(named: "Whistler.png")!
        let dimensionX: UIImage = UIImage(named: "DimensionX.png")!
        let xminusOne: UIImage = UIImage(named: "XMinusOne.png")!
        let hopalongCassidy: UIImage = UIImage(named: "Hopalong.png")!
        let fortLaramie: UIImage = UIImage(named: "FortLaramie.png")!
        let jackBenny: UIImage = UIImage(named: "Jack Benny")!
        let innerSanctum: UIImage = UIImage(named: "Inner Sanctum.png")!

        switch (showId)
        {
        case "BurnsAndAllen":
            imgPlay.image = burnsImage
            break
        case "Bob Hope":
            imgPlay.image = bobHopeImage
            break
        case "Fibber McGee":
            imgPlay.image = fibberMcGeeImage
            break
        case "Gildersleeves":
            imgPlay.image = gildersleeves
            break
        case "MartinAndLewis":
            imgPlay.image = martinAndLewis
            break
        case "NightBeat":
            imgPlay.image = nightBeat
            break
        case "Speed":
            imgPlay.image = speed
            break
        case "Whistler":
            imgPlay.image = whistler
            break
        case "DimensionX":
            imgPlay.image = dimensionX
            break
        case "XMinusOne":
            imgPlay.image = xminusOne
            break
        case "Hopalong Cassidy":
            imgPlay.image = hopalongCassidy
            break
        case "FortLaramie":
            imgPlay.image = fortLaramie
            break
        case "JackBenny":
            imgPlay.image = jackBenny
            break
        case "InnerSanctum":
            imgPlay.image = innerSanctum
            break
        default:
            break
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        navigationItem.title = "One"
    }
}
