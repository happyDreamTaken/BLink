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
    func sn_font(_ font: UIFont?) -> UILabel {
        self.font = font
        return self
    }
    
    func sn_textColor(_ color: UIColor?) -> UILabel {
        self.textColor = color
        return self
    }
    
    func sn_backgroundColor(_ backgroundColor: UIColor?) -> UILabel {
        self.backgroundColor = backgroundColor
        return self
    }
    
    func sn_text(_ text: String?) -> UILabel {
        self.text = text
        return self
    }
    
    func sn_frame(_ frame: CGRect) -> UILabel {
        self.frame = frame
        return self
    }
    
    func sn_textAlignment(_ alignment:NSTextAlignment?) -> UILabel {
        self.textAlignment = alignment!
        return self
    }
}
