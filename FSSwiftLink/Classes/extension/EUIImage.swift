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
    
    //根据传入的宽度生成一张按照宽高比压缩的新图片
 public func imageWithScale(width:CGFloat) -> UIImage{
        //1.根据 宽度 计算高度
        let height = width * size.height / size.width
        //2.按照宽高比绘制一张新的图片
        let currentSize = CGSize.init(width: width, height: height)
        UIGraphicsBeginImageContext(currentSize)  //开始绘制
        draw(in: CGRect.init(origin: CGPoint.zero, size: currentSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()  //结束上下文
        return newImage!
    }
}
