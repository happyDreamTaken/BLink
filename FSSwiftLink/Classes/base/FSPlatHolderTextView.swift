//
//  FSPlatHolderTextView.swift
//  Travels
//
//  Created by MrFeng on 2019/7/26.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import UIKit

open class FSPlatHolderTextView: UITextView {
    
    public var platholdText:String?{
        willSet {
            self.platholdText = newValue
        }
        didSet {
            self.platerLabel?.text = self.platholdText
        }
    }
    
    public var platerLabel:UILabel?
    
    public var textFont:UIFont? {
        willSet {
            self.textFont = newValue
        }
        didSet {
            self.platerLabel?.font = self.textFont
        }
    }
    
    public var platerColor:UIColor? {
        willSet {
            self.platerColor = newValue
        }
        
        didSet {
            self.platerLabel?.textColor = self.platerColor
        }
    }
    

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: self)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func textChanged() {
        
        if self.platholdText?.count == 0 {
            return
        }
        
        if self.text.count == 0 {
            self.platerLabel?.alpha = 1
        }
        
        if self.text.count > 0 {
            self.platerLabel?.alpha = 0
        }
        
    }
    
    public func updata() {
        self.platerLabel?.textColor = self.platerColor
        self.platerLabel?.text = self.platholdText
        self.platerLabel?.font = self.textFont
    }
    
}

extension FSPlatHolderTextView {
    func setupUI() {
        self.platerLabel = UILabel.init()
        self.platerLabel?.frame = CGRect.init(x: 8, y: 8, width: self.bounds.width - 16, height: 0)
        self.platerLabel?.lineBreakMode = .byWordWrapping
        self.platerLabel?.numberOfLines = 0
        self.platerLabel?.font = self.font
        self.platerLabel?.textColor = self.platerColor
        self.platerLabel?.text = platholdText
        self.platerLabel?.alpha = 0
        self.platerLabel?.tag = 999
        self.addSubview(self.platerLabel!)
        self.platerLabel?.sizeToFit()
        
        if self.text.count == 0 && self.platholdText?.count ?? "".count > 0 {
            self.viewWithTag(999)?.alpha = 1
        }
        
    }
}


