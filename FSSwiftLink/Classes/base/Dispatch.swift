//
//  Dispatch.swift
//  Travels
//
//  Created by MrFeng on 2019/7/31.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    /// dispatch_after
    class func after(_ after: Double, _ block: @escaping ()->Void) {
        self.main.asyncAfter(deadline: DispatchTime.now() + after, execute: block)
    }
    
    /// dispatch_once
    class func once(_ token: inout Bool, _ block: ()->Void) {
        if token == false {
            objc_sync_enter(token)
            if token == false {
                block()
                token = true
            }
            objc_sync_exit(token)
        }
    }
}
