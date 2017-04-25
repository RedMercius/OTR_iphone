//
//  PlayControl.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 4/8/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerGlobal
{

    var audioPlayer: AVPlayer!
}

class PlayControl {
    
    let pg = PlayerGlobal()
    
    let TAG: String = "PlayControl: "
    public func playRemoteFile(musicFile: String)
    {
        print(TAG + "MusicFile: \(musicFile)")
        let audioFilePath = "http://www.JohnnieRuffin.com/audio/" + musicFile;
        print(TAG + "MusicPath: \(audioFilePath)")
        let audioFileUrl = URL(string: audioFilePath)
        
        if (pg.audioPlayer!.rate != 1.0 )
        {
           let playerItem: AVPlayerItem = AVPlayerItem(url: audioFileUrl!)
           pg.audioPlayer = AVPlayer(playerItem: playerItem)
           pg.audioPlayer.volume = 1.0
           pg.audioPlayer.rate = 1.0
           pg.audioPlayer.play()
        }
        else
        {
           let updatedPlayerItem: AVPlayerItem = AVPlayerItem(url: audioFileUrl!)
           pg.audioPlayer?.replaceCurrentItem(with: updatedPlayerItem)
           pg.audioPlayer?.play()
        }
    }
}
