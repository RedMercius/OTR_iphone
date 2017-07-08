//
//  Utility.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/21/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import Foundation

class Utility {
    
    public func getFilePath(showId: String) -> String
    {
        var filePath: String = "none"
        switch (showId)
        {
        case "BurnsAndAllen":
            filePath = "http://www.JohnnieRuffin.com/audio/"
            break
        case "Bob Hope":
            filePath = "http://www.JohnnieRuffin.com/audio/BobHope/"
            break
        case "Fibber McGee":
            filePath = "http://www.JohnnieRuffin.com/audio/FibberMcGeeandMolly1940/"
            break
        case "Gildersleeves":
            filePath = "http://www.JohnnieRuffin.com/audio/Otrr_The_Great_Gildersleeve_Singles/"
            break
        case "MartinAndLewis":
            filePath = "http://www.JohnnieRuffin.com/audio/MartinAndLewis_OldTimeRadio/"
            break
        case "NightBeat":
            filePath = "http://www.JohnnieRuffin.com/audio/NightBeat/"
            break
        case "Speed":
            filePath = "http://www.JohnnieRuffin.com/audio/Speed/"
            break
        case "Whistler":
            filePath = "http://www.JohnnieRuffin.com/audio/TheWhistler/"
            break
        case "DimensionX":
            filePath = "http://www.JohnnieRuffin.com/audio/DimensionX/"
            break
        case "XMinusOne":
            filePath = "http://www.JohnnieRuffin.com/audio/XMinus1/"
            break
        case "Hopalong Cassidy":
            filePath = "http://www.JohnnieRuffin.com/audio/Hopalong/"
            break
        case "FortLaramie":
            filePath = "http://www.JohnnieRuffin.com/audio/FtLaramie/"
            break
        case "JackBenny":
            filePath = "http://www.JohnnieRuffin.com/audio/JackBenny/"
            break
        case "InnerSanctum":
            filePath = "http://www.JohnnieRuffin.com/audio/InnerSanctum/"
            break
        default:
            break
        }
        return filePath
    }
    
    /*func findKeyForValue(value: String, dictionary: String) ->String?
    {
        for (key, array) in dictionary
        {
            if (array.contains(value))
            {
                return key
            }
        }
        
        return nil
    }*/
}
