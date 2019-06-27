//
//  FSUrlSessionManager.swift
//  Blink_Example
//
//  Created by MrFeng on 2019/6/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class FSUrlSessionManager: NSObject {
    
    static let manager = FSUrlSessionManager()
    
    enum NetStyle {
        case GET
        case POST
    }
    
    func request(params:NSMutableDictionary,url:String) -> Void {
        var request = URLRequest.init(url: URL.init(string: url)!, cachePolicy: URLRequest.CachePolicy.init(rawValue: 1)!, timeoutInterval: 7)
        
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
        }
        
        
    }
    
    lazy var sessionConfig = URLSessionConfiguration.default
    
    

}
