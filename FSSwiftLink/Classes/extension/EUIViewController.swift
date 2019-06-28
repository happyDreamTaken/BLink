//
//  EUIViewController.swift
//  QuickDecision
//
//  Created by MrFeng on 2019/6/19.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import Foundation
import UIKit

open extension UIViewController {
    func setBGColor(_ color:UIColor) {
        weak var weakSelf = self // 弱引用
        weakSelf?.view.backgroundColor = color
    }
    func setBGColor(color:UIColor) {
        weak var weakSelf = self // 弱引用
        weakSelf?.view.backgroundColor = color
    }
    
    /// 快速设置title
    func setTitle(title:String) {
        weak var weakSelf = self // 弱引用
        weakSelf?.title = title
    }
    
    // MARK: - 跳转相关
    /// 快速push到指定控制器 name:控制器名
    func pushController(name:String) {
        _ = pushSetController(name: name)
    }
    
    func pushSetController(name:String) -> UIViewController {
        weak var weakSelf = self // 弱引用
        // 1.获取命名空间
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            return UIViewController()
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + name)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            return UIViewController()
        }
        // 3.通过Class创建对象
        let vc = clsType.init()
        weakSelf!.navigationController?.pushViewController(vc, animated: true)
        return vc
    }
    
    /// 快速返回指定的控制器 name:要返回的控制器名 (注意:要返回的控制器必须在navigationController的子控制器数组中)
    func popToViewController(name:String) { // 使用 self.popToViewController(name: "JYKMeViewController")
        weak var weakSelf = self // 弱引用
        // 1.获取命名空间
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            return
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + name)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard (cls as? UIViewController.Type) != nil else {
            return
        }
        for  controller in (weakSelf!.navigationController?.viewControllers)! {
            if controller.isKind(of: cls!) {
                weakSelf!.navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    /// 快速返回根的控制器
    func popToRootViewController() {
        weak var weakSelf = self // 弱引用
        weakSelf!.navigationController?.popToRootViewController(animated: true)
    }
    
    func presentController(name:String) {
        _ = presentSetController(name: name)
    }
    func presentSetController(name:String) -> UIViewController {
        // 1.获取命名空间
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            return UIViewController()
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + name)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            return UIViewController()
        }
        // 3.通过Class创建对象
        let vc = clsType.init()
        let nav = UINavigationController(rootViewController: vc)
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: {
        })
        return vc
    }
    /// 修改导航栏的背景颜色 colorHex:颜色的16进制
    func setNavigationBarBackgroundColor(colorHex: String)  {
       
       navigationController?.navigationBar.barTintColor = UIColor.clear
       
        navigationController?.navigationBar.backgroundColor = UIColor.clear; navigationController?.navigationBar.setBackgroundImage(UIImage.imageColor(color:UIColor.init(hexString: colorHex)), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
}
