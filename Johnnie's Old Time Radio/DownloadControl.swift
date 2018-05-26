//
//  DownloadControl.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 7/6/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import Foundation

class DownloadControl : NSObject, URLSessionTaskDelegate, URLSessionDownloadDelegate {
    
    static var shared = DownloadControl()
    let TAG = "DownloadControl: "
    var fileName = "Unknown"
    
    let ut = Utility()
    
    var session : URLSession {
        get {
            let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
            
            // Warning: If an URLSession still exists from a previous download, it doesn't create
            // a new URLSession object but returns the existing one with the old delegate object attached!
            return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        if totalBytesExpectedToWrite > 0 {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            debugPrint("Progress \(downloadTask) \(progress)")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        debugPrint("Download finished: \(location)")
        try? FileManager.default.removeItem(at: location)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        debugPrint("Task completed: \(task), error: \(String(describing: error))")
    }
    
    public func isFileInDownload() -> Bool
    {
        return false
    }
    
    func calculateProgress(session : URLSession, completionHandler : @escaping (Float) -> ()) {
        session.getTasksWithCompletionHandler { (tasks, uploads, downloads) in
            let bytesReceived = downloads.map{ $0.countOfBytesReceived }.reduce(0, +)
            let bytesExpectedToReceive = downloads.map{ $0.countOfBytesExpectedToReceive }.reduce(0, +)
            let progress = bytesExpectedToReceive > 0 ? Float(bytesReceived) / Float(bytesExpectedToReceive) : 0.0
            completionHandler(progress)
        }
    }
    
    public func downloadFile (path: String, showId: String, session: URLSession )
    {
        print(TAG + path)
        fileName = path
        let filePath = ut.getFilePath(showId: showId) + path
        let url = URL(string: filePath)!
        let task = session.downloadTask(with: url)
        task.resume()
        print(TAG + "Music Path: \(filePath))")
    }
}
