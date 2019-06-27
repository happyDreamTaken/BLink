//
//  EUIImage.swift
//  Payment
//
//  Created by MrFeng on 2019/6/14.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
  open  class func imageColor(color:UIColor)->UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
