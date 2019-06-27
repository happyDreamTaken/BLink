//
//  FSSwiftHeightCache.swift
//  Blink_Example
//
//  Created by MrFeng on 2019/6/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class FSSwiftHeightCache: NSObject {
    
    enum HeightCacheMode {
        case HeightCacheByModelID
        case HeightCacheByIndexID
        
    }
    
    var FSHeightDicts = NSMutableDictionary.init()
    
    func accodingModelID_cacheHeightWith(idetifier:String , cellHeight:CGFloat){
        let cellHeight = NSNumber.init(value: Float(cellHeight))
        FSHeightDicts.setValue(cellHeight, forKey: idetifier)
    }
    
    func accordingIndexPath_cacheHeightWith(indexPath:NSIndexPath , cellHeight:CGFloat) -> Void {
       
        let cellHeight = NSNumber.init(value: Float(cellHeight))
        let indexIdvalue = String.init(format: "indexAt%lu", indexPath.row)
        FSHeightDicts.setValue(cellHeight, forKey: indexIdvalue)
        
    }
    

    func cellHeightWith(key:String) -> CGFloat {
        if FSHeightDicts[key] == nil {
            return 0.0;
        }
        
        let cellHeight = FSHeightDicts.value(forKey: key)
        if cellHeight is NSNumber {
            guard let flCellHeight = Float.init(exactly: cellHeight as! NSNumber) else { return 0.001 }
            return CGFloat.init(flCellHeight)
        }else{
            print("数据取值错误，无正确缓存\(#function)")
            return 44
        }
        
    }
}
