//
//  EUIButton.swift
//  QuickDecision
//
//  Created by MrFeng on 2019/6/19.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
   open func sn_font(_ font:UIFont) -> UIButton{
        self.titleLabel?.font = font
        return self
    }
    
   open func sn_normalTextColor(_ color:UIColor) -> UIButton{
        self.setTitleColor(color, for: .normal)
        return self
    }
    
   open func sn_selectTextColor(_ color:UIColor) -> UIButton{
        self.setTitleColor(color, for: .selected)
        return self
    }
    
   open func sn_text(_ title:String) -> UIButton{
        self.setTitle(title, for: .normal)
        return self
    }
    
   open func sn_layCorners(_ corners:CGFloat) -> UIButton{
        self.layer.cornerRadius = corners
        self.layer.masksToBounds = true
        return self
    }
    
   open func sn_backGround(_ color:UIColor) -> UIButton {
        self.backgroundColor = color
        return self
    }
    
   open func sn_hight(_ color:UIColor) -> UIButton {
        self.setTitleColor(color, for: .highlighted)
        return self
    }
    
   open func sn_normalImage(_ img:String) ->UIButton {
        self.setImage(UIImage.init(named: img), for: .normal)
        return self
    }
    
   open func sn_hignImg(_ img:String) -> UIButton {
        self.setImage(UIImage.init(named: img), for: .highlighted)
        return self
    }
    
   open func sn_selectImg(_ img:String) -> UIButton {
        self.setImage(UIImage.init(named: img), for: .selected)
        return self
    }
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let margin: CGFloat = 10
        let area = self.bounds.insetBy(dx: -margin, dy: -margin) //负值是方法响应范围
        return area.contains(point)
    }
}
