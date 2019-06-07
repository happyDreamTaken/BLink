//
//  FTableBaseView.swift
//  Blink_Example
//
//  Created by MrFeng on 2019/5/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class FTableBaseView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
        
        self.estimatedRowHeight = 0.0;
        self.estimatedSectionFooterHeight = 0.0;
        self.estimatedSectionHeaderHeight = 0.0;
        
        self.backgroundColor = .white;
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //复用方式注册
    public func name_registerCell(cellName : String , cell : AnyClass) {
        
        self.register(cell, forCellReuseIdentifier: cellName)
        
    }
    
    //复用方式获取cell
    public func string_dequecell(cellName:String , atIndex:IndexPath) -> UITableViewCell{
        return self .dequeueReusableCell(withIdentifier: cellName, for: atIndex)
    }
    
    
    //非复用方式注册
    public func index_registerCell(indexPath:IndexPath , cell : AnyClass) {
        self.register(cell, forCellReuseIdentifier: NSStringFromClass(cell.class()).appending(String(indexPath.row)))
        
    }
    
    //非复用方式取cell
    public func index_deque(cell:AnyClass , index:IndexPath) -> UITableViewCell{
        return self.dequeueReusableCell(withIdentifier: NSStringFromClass(cell).appending(String(index.row)), for: index)
    }

    
}
