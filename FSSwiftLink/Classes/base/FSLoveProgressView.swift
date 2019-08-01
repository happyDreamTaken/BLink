//
//  FSLoveProgressView.swift
//  Travels
//
//  Created by MrFeng on 2019/7/26.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import UIKit

open class FSLoveProgressView: UIView {
    
    public var numsOfStar:Int!
    let backgroundStarts = 5
    
    typealias CallBack = (_ curView:FSLoveProgressView , _ score:Float) -> ()
    
    var callBack : CallBack!
    
    var startbackView : UIView!
    var startForegroundView : UIView!
    var backStartName:String!
    var foreStartName:String!
    

    init(frame: CGRect , numsOfStar:Int , foreName:String , backName:String) {
        super.init(frame: frame)
        self.numsOfStar = numsOfStar
        
        self.backStartName = backName
        self.foreStartName = foreName
        
        commitInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public func commitInit() {
        self.startbackView = self.buildView(imgName: self.backStartName)
        self.startForegroundView = self.buildView(imgName: self.foreStartName)
        self.startForegroundView.alpha = 0
        self.addSubview(self.startForegroundView)
        self.addSubview(self.startbackView)
    }
    
    
    
    public func buildView(imgName:String) -> UIView {
        let frame = self.bounds
        let view = UIView.init(frame: frame)
        view.clipsToBounds = true
        for i in 0 ..< self.numsOfStar {
            let imgView = UIImageView.init(image: UIImage.init(named: imgName))
            imgView.frame = CGRect.init(x: CGFloat(i) * frame.size.width / CGFloat(self.numsOfStar), y: 0, width: frame.size.width / CGFloat(self.numsOfStar), height: frame.size.height)
            view.addSubview(imgView)
        }
        
        return view
    }
    
    func changeForegroundPoint(point:CGPoint) {
        self.startForegroundView.alpha = 1
        var _point = point
        if _point.x < 0 {
            _point.x = 0
        }
        if _point.x > self.width {
            _point.x = self.width
        }
        let str = String.init(format: "%.2f", Float(_point.x / self.width))
        let floScore = Float(str)
        self.startForegroundView.frame = CGRect.init(x: 0, y: 0, width: _point.x, height: self.height)
        
        if self.callBack != nil {
            self.callBack(self , floScore!)
        }
        
    }
    
    public func setScore(score:Float , withAnimation:Bool , callback:@escaping (Bool) -> Void) {
        var scoreNum = score
        
        if score < 0 {
            scoreNum = 0
        }
        
        if score > 1 {
            scoreNum = 1
        }
        
        let point = CGPoint.init(x: CGFloat(scoreNum)*self.frame.size.width, y: 0)
        
        if withAnimation {
            UIView.animate(withDuration: 0.35, animations: {
                self.changeForegroundPoint(point: point)
            }) { (bs) in
                callback(bs)
            }
        }else {
            self.changeForegroundPoint(point: point)
        }
        
    }
    
}


extension FSLoveProgressView {
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
        let point = (touch?.location(in: self))!
         let rect  = CGRect.init(x: 0, y: 0, width: self.width, height: self.height)
        if rect.contains(point) {
            self.changeForegroundPoint(point: point)
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = (touch?.location(in: self))!
        UIView.animate(withDuration: 0.35, animations: {
            self.changeForegroundPoint(point: point)
        }) { (isok) in
            
        }
    }
}
