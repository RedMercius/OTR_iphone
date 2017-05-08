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
        let playerItem: AVPlayerItem = AVPlayerItem(url: audioFileUrl!)
        pg.audioPlayer = AVPlayer(playerItem: playerItem)
        
        if ( false == isPlaying() )
        {
           
           // pg.audioPlayer.volume = 1.0
           pg.audioPlayer.rate = 1.0
           pg.audioPlayer.play()
           print(TAG + "First Time Playing")
        }
        else
        {
           let updatedPlayerItem: AVPlayerItem = AVPlayerItem(url: audioFileUrl!)
           pg.audioPlayer?.replaceCurrentItem(with: updatedPlayerItem)
           pg.audioPlayer?.play()
           print(TAG + "Next Time Playing")
        }
    }
    
    public func pause()
    {
        pg.audioPlayer.pause()
    }
    
    public func forward15()
    {
        let currentTime = pg.audioPlayer.currentTime()
        let timeToAdd = CMTimeMakeWithSeconds(15,1)
        
        let resultTime  = CMTimeAdd(currentTime,timeToAdd)
        
        pg.audioPlayer.seek(to: resultTime)
    }
    
    public func back15()
    {
        let currentTime = pg.audioPlayer.currentTime();
        let timeToSubtract = CMTimeMakeWithSeconds(15,1);
        let resultTime  = CMTimeSubtract (currentTime,timeToSubtract);
        
        pg.audioPlayer.seek(to: resultTime)

    }
    
    public func resumePlay()
    {
        pg.audioPlayer.play()
    }
    
    public func getDuration() -> CMTime
    {
        return pg.audioPlayer.currentItem!.duration
    }
    
    public func getCurrentTime() -> CMTime
    {
        return pg.audioPlayer.currentTime()
    }
    
    public func isPlaying() -> Bool
    {
        if (pg.audioPlayer.rate == 1.0 )
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    public func setVolume(value: Float)
    {
        pg.audioPlayer.volume = value
    }
    
    public func getVolume() -> Float
    {
        return pg.audioPlayer.volume
    }
}
