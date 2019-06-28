//
//  EUILabel.swift
//  Payment
//
//  Created by MrFeng on 2019/6/14.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
   open func sn_font(_ font: UIFont?) -> UILabel {
        self.font = font
        return self
    }
    
   open func sn_textColor(_ color: UIColor?) -> UILabel {
        self.textColor = color
        return self
    }
    
   open func sn_backgroundColor(_ backgroundColor: UIColor?) -> UILabel {
        self.backgroundColor = backgroundColor
        return self
    }
    
   open func sn_text(_ text: String?) -> UILabel {
        self.text = text
        return self
    }
    
   open func sn_frame(_ frame: CGRect) -> UILabel {
        self.frame = frame
        return self
    }
    
   open func sn_textAlignment(_ alignment:NSTextAlignment?) -> UILabel {
        self.textAlignment = alignment!
        return self
    }
}
