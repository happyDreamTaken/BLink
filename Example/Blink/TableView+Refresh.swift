//
//  TableView+Refresh.swift
//  Blink_Example
//
//  Created by MrFeng on 2019/5/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
private var key : Void?

extension UITableView {
    @IBInspectable var page : NSInteger {
        get {
            return objc_getAssociatedObject(self, &key) as? NSInteger ?? 1
        }
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
}
