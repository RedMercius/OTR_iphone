//
//  DownloadControl.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 7/6/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import Foundation

class DownloadControl {
   
    static var shared = DownloadControl()
    let TAG = "DownloadControl: "
    var fileName = "Unknown"
    
    let ut = Utility()
    
    func load(url: URL, to localUrl: URL, completion: @escaping () -> ()) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = try! URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: localUrl)
                    completion()
                } catch (let writeError) {
                    print("error writing file \(localUrl) : \(writeError)")
                }
                
            } else {
                print("Failure: %@", error?.localizedDescription);
            }
        }
        task.resume()
    }
    
    public func downloadFile (path: String, showId: String)
    {
        print(TAG + path)
        fileName = path
        var filePath = ut.getFilePath(showId: showId) + path
        var url = URL(string: filePath)!
        let localPath = URL(string: NSSearchPathForDirectoriesInDomains(.musicDirectory, .userDomainMask, true)[0] as String)
        // var localURL = NSURL(string: localPath)
        print(TAG + "Music Path: \(filePath))")
        print(TAG + "Local Path: \(localPath)")
     /*   let task = load(url: url, to: localPath!, completion: this.self)
        task.resume()*/
    }
}
